var url = require('url');
var fs = require('fs-extra');
var path = require('path');
var request = require('request');

app.use('/', function(req, res) {

	var uri = url.parse(req.originalUrl);
	var remote = url.resolve('http://dumper.demojs0.oml.ru/', uri.pathname);
	var filepath = path.join(CACHE_DIR, uri.pathname);

	var stream = request.get(remote);

	stream.on('error', function(err) {
		res.sendError(err);
	});

	stream.on('response', function(response) {
		if (response.statusCode !== 200) {
			res.sendError('Not found:\n' + req.originalUrl);
			this.abort();
		} else {
			fs.ensureDirSync(path.dirname(filepath));
			var writeStream = fs.createWriteStream(filepath);
			writeStream.on('finish', function() {
				res.sendfile(filepath);
			});
			this.pipe(writeStream);
		}
	});

});