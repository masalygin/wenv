var url = require('url');
var fs = require('fs');
var extra = require('fs-extra');
var path = require('path');
var request = require('request');
var utils = require('../lib/utils')

module.exports = function(app) {

	app.use('/', function(req, res) {

		var uri = url.parse(req.originalUrl);
		var u = url.resolve('http://dumper.demojs0.oml.ru/', uri.pathname);
		var p = path.join('./.cache', uri.pathname);

		extra.mkdirp(path.dirname(p), function(err) {

			if (err) {

				utils.error(err, res);
				return;
			}

			request
				.get(u)
				.on('error', function(err) {

					utils.error(err, res);

				})
				.on('response', function(response) {

					if (response.statusCode !== 200) {

						utils.error(uri.pathname + '\nNOT FOUND', res);
						this.abort();

					} else {

						var writeStream = fs.createWriteStream(p);

						writeStream.on('finish', function() {
							res.sendfile(p);
						});

						this.pipe(writeStream);

					}

				});

		});

	});

};