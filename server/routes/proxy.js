var url = require('url');
var fs = require('fs');
var extra = require('fs-extra');
var path = require('path');
var request = require('request');

module.exports = function(app) {

	app.use('/', function(req, res, next) {

		var uri = url.parse(req.originalUrl);
		var u = url.resolve('http://dumper.demojs0.oml.ru/', uri.pathname);
		var p = path.join('./.cache', uri.pathname);

		extra.mkdirp(path.dirname(p), function(err) {

			var writeStream = fs.createWriteStream(p);

			request
				.get(u)
				.on('error', function(err) {
					console.log(err);
					next();
				})
				.pipe(writeStream);

			writeStream.on('finish', function() {
				res.sendfile(p);
			});

		});

	});

};