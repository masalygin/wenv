var config = require('../config');
var lib = require('../lib');
var path = require('path');
var url = require('url');
var fs = require('fs-extra');
var _ = require('lodash');
var Smarty = require('../smarty');


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

		lib.sassToCache(dir, path.join(cacheDir, 'site'), '**/*.scss');


		fs.readFile(filepath, function(err, buffer) {

			if (err) {
				lib.sendError(err,  res);
				return;
			}

			var text = Smarty.prototype.getTemplatePipe.call(null, buffer);


			var tpl = new Smarty(text, {
				smarty: {
					'get': req.query
				}
			});

			var html = tpl.fetch(config.smarty);

			res.send(html);

		});

	});

};