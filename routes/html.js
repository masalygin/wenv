var config = require('../config');
var lib = require('../lib');
var path = require('path');
var url = require('url');
var fs = require('fs-extra');
var _ = require('lodash');
var Smarty = require('../smarty');
var chokidar = require('chokidar');


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


module.exports = function (app) {

	var workDir = app.get('workDir');
	var cacheDir = app.get('cacheDir');
	var templatesDir = app.get('templatesDir');
	var prevDir = null;
	var watcher = null;

	var reload = _.debounce(function() {

		if (app.socket) {
			app.socket.emit('reload');
			console.log('reload');
		}

	}, 500);


	app.get(/^.+\.(html|tpl)(\?.*)?$/, function (req, res) {

		var uri = url.parse(req.originalUrl);
		var filepath = path.join(workDir, uri.pathname);
		var dir = path.dirname(filepath);

		Smarty.prototype.templatesDir = dir;
		Smarty.prototype.globalDir = templatesDir;

		Smarty.prototype.getTemplatePipe = function(buffer, filename, resource) {
			var text = buffer.toString();
			text = replaceByGet(text, req.query);
			text = replace(text);
			return text;
		};

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

					}

					reload();
				}

			});

		}

		prevDir = dir;


		fs.readFile(filepath, function(err, buffer) {

			if (err) {
				lib.sendError(err,  res);
				return;
			}

			var text = Smarty.prototype.getTemplatePipe.call(null, buffer) +
				'{include file="global:livereload.tpl"}';


			var tpl = new Smarty(text, {
				smarty: {
					'get': req.query,
					ip: app.get('ip'),
					port: app.get('port')
				}
			});

			var html = tpl.fetch({});

			res.send(html);

		});

	});

};