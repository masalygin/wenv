var config = require('../config');
var lib = require('../lib');
var path = require('path');
var url = require('url');
var _ = require('lodash');
var chokidar = require('chokidar');
var Collector = require('../lib/fcollector');


function replace(text, aliases) {

	aliases = aliases || config.replace['*'];

	_.each(aliases, function(val, key) {
		text = text.replace(new RegExp(lib.regexpEscape(key), 'g'), val);
	});

	return text;
}


function replaceByGet(text, query) {

	var GET = config.replace['get'];

	_.each(query, function(val, key) {
		if (GET[key]) {
			if (GET[key][val]) {
				text = replace(text, GET[key][val]);
			}
		}
	});

	return text;
}


var smartyTagsRegExp = new RegExp('(\\{\\/?(' + config.replace.smarty.join('|') + ')[^\\}]*\\})', 'g');;

function removeSmartyTags(text) {
	return text.replace(smartyTagsRegExp, '');
}


module.exports = function (app) {

	var workDir = app.get('workDir');
	var cacheDir = app.get('cacheDir');
	var templatesDir = app.get('templatesDir');
	var prevDir = null;
	var watcher = null;

	var reload = _.debounce(function(type) {

		app.io.emit('reload', type);

	}, 500);


	app.get(/^.+\.(html|tpl)(\?.*)?$/, function (req, res) {

		var uri = url.parse(req.originalUrl);
		var filepath = path.join(workDir, uri.pathname);
		var dir = path.dirname(filepath);


		if (prevDir != dir) {

			if (watcher) {
				watcher.close();
			}

			lib.cache.sass.add(dir);

			watcher = chokidar.watch(dir, {
				ignored: /[\/\\]\./,
				ignorePermissionErrors: true,
				persistent: true
			});

			watcher.on('all', function(event, filepath) {

				if (event == 'add' || event == 'change' || event == 'unlink') {


					if (/\.scss$/.test(filepath)) {

						if (event == 'unlink') {
							lib.cache.sass.remove(filepath);
						} else {
							lib.cache.sass.add(filepath);
						}

						reload(filepath);

					} else {

						reload();

					}


				}

			});

		}

		prevDir = dir;


		new Collector({

			altPath: app.get('templatesDir'),

			main: filepath,

			success: function(text) {

				text = removeSmartyTags(text);
				text += '<script src="/wenv/socket.io.js"></script>' +
						'<script src="/wenv/livereload.js"></script>';

				res.send(text);

			},

			error: function(err) {

				utils.error(uri.pathname + '\n' + err, res);

			},

			pipe: function(data) {

				var self = this;
				var sub = [];

				data = replaceByGet(data, req.query);
				data = replace(data);

				data = data.replace(/\{include\s+file="(db|global):([^"]+)"[^\}]*\}/g, function(include, resource, filename) {

					var s = {};
					s.filepath = path.resolve(dir, filename);
					s.include = include;

					if (resource === 'global') {
						s.altpath = path.resolve(self.altPath, filename);
					}

					sub.push(s);

					return self.label + s.filepath;

				});

				return {
					data: data,
					sub: sub
				};

			}

		});

	});

};