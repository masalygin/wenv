var path = require('path');
var url = require('url');
var exec = require('child_process').exec;
var Watcher = require('../lib/watcher');


app.all(/^.+\.(html|tpl)(\?.*)?$/, function (req, res) {

	var uri = url.parse(req.originalUrl);
	var filepath = path.join(WORK_DIR, uri.pathname);
	var dir = path.dirname(filepath);
	var filename = path.basename(filepath);

	Watcher.setDir(dir);

	var options = {
		_GET: req.query,
		_POST: req.body,
		_COOKIE: req.cookies,
		FILENAME: filename,
		WORK_DIR: dir + '/',
		TEMPLATES_DIR: TEMPLATES_DIR + '/',
		CACHE_DIR: CACHE_DIR + '/'
	};

	options = encodeURIComponent(JSON.stringify(options));

	var command = ['C:/PHP/php'];
	command.push(SMARTY_COMMAND);
	command.push(options);
	command = command.join(' ');

	exec(command, function(error, stdout, stderr) {

		if (error || stderr) {

			res.sendError(uri.pathname + '\n' + error + '\n' + stderr);

		} else {

			stdout += '\n\n\n\n<script src="/wenv/livereload.min.js"></script>';
			res.send(stdout);

		}
	});


});