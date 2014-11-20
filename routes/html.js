var config = require('../config');
var lib = require('../lib');
var path = require('path');
var url = require('url');
var fs = require('fs-extra');
var _ = require('lodash');
var Smarty = lib.Smarty;


function replace(data, aliases) {
	aliases = aliases || config.replace['*'];
	_.each(aliases, function(val, key) {
		data = data.replace(new RegExp(lib.regexpEscape(key), 'g'), val);
	});
	return data;
}


function replaceByGet(data, query) {
	var GET = config.replace['get'];
	_.each(query, function(val, key) {
		if (GET[key]) {
			if (GET[key][val]) {
				data = replaceAliases(data, GET[key][val]);
			}
		}
	});
	return data;
}


module.exports = function (app) {

	var workDir = app.get('workDir');

	Smarty.prototype.globalDir = app.get('templatesDir');

	app.get(/^.+\.(html|tpl)(\?.*)?$/, function (req, res) {

		var uri = url.parse(req.originalUrl);
		var filepath = path.join(workDir, uri.pathname);
		var dir = path.dirname(filepath);
		var isScssReady = false;
		var isHtmlReady = false;
		var html = '';

		Smarty.prototype.templatesDir = dir;

		function send() {
			if (isScssReady && isHtmlReady) {
				res.send(html);
			}
		}


		//utils.replace({
		//	glob: dir + '/**/*.scss',
		//	dest: '.cache/site/',
		//	search: /global:\//g,
		//	replacement: ''
		//}).on('end', function() {
		//	isScssReady = true;
		//	send();
		//});


		fs.readFile(filepath, function(err, buffer) {

			if (err) {
				lib.sendError(err,  res);
				return;
			}

			var text = buffer.toString();
			var tpl = new Smarty(text);
			text = tpl.fetch(config.smarty);

			res.send(text);

		});


		/*new Collector({

			altPath: './client/resources/tpl',

			main: filepath,

			success: function(data) {

				html = replaceSmarty(data);
				isHtmlReady = true;
				send();

			},

			error: function(err) {

				lib.sendError(uri.pathname + '\n' + err, res);

			},

			pipe: function(data) {

				var self = this;
				var sub = [];

				data = replaceByGet(data, req.query);
				data = replaceAliases(data);

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
		});*/

	});


};