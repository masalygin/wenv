var url = require('url');
var fs = require('fs');
var extra = require('fs-extra');
var path = require('path');
var request = require('request');

app.use('/', function(req, res) {

	var uri = url.parse(req.originalUrl);
	var u = url.resolve('http://dumper.demojs0.oml.ru/', uri.pathname);
	var p = path.join(CACHE_DIR, uri.pathname);

	extra.mkdirp(path.dirname(p), function(err) {

		if (err) {

			res.sendError(err);
			return;
		}

		request
			.get(u)
			.on('error', function(err) {

				res.sendError(err);

			})
			.on('response', function(response) {

				if (response.statusCode !== 200) {

					res.sendError(uri.pathname + '\nNOT FOUND');
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