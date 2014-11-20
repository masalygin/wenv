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
	var cacheDir = app.get('cacheDir');

	Smarty.prototype.globalDir = app.get('templatesDir');

	app.get(/^.+\.(html|tpl)(\?.*)?$/, function (req, res) {

		var uri = url.parse(req.originalUrl);
		var filepath = path.join(workDir, uri.pathname);
		var dir = path.dirname(filepath);


		Smarty.prototype.templatesDir = dir;


		lib.sassToCache(dir, path.join(cacheDir, 'site'), '**/*.scss');


		fs.readFile(filepath, function(err, buffer) {

			if (err) {
				lib.sendError(err,  res);
				return;
			}

			var text = buffer.toString();
			var tpl = new Smarty(text);
			var html = tpl.fetch(config.smarty);

			res.send(html);

		});

	});

};