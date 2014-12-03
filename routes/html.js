var Sass = require('../lib/sass');
var path = require('path');
var url = require('url');
var _ = require('lodash');
var chokidar = require('chokidar');
var exec = require('child_process').exec;

var prevDir = null;
var watcher = null;

var reload = _.throttle(function(type) {

	app.io.emit('reload', type);

}, 500);


app.all(/^.+\.(html|tpl)(\?.*)?$/, function (req, res) {

	var uri = url.parse(req.originalUrl);
	var filepath = path.join(WORK_DIR, uri.pathname);
	var dir = path.dirname(filepath);
	var filename = path.basename(filepath);

	if (prevDir != dir) {

		if (watcher) {
			watcher.close();
		}

		Sass.clearCacheSite();
		Sass.addToCache(dir);

		watcher = chokidar.watch(dir, {
			ignored: /[\/\\]\./,
			ignorePermissionErrors: true,
			persistent: true
		});

		watcher.isReady = false;

		watcher.on('ready', function() {
			watcher.isReady = true;
		});

		watcher.on('all', function(event, filepath) {

			if (watcher.isReady && event == 'add' || event == 'change' || event == 'unlink') {

				if (/\.scss$/.test(filepath)) {

					if (event == 'unlink') {
						Sass.removeFromCache(filepath);
					} else {
						Sass.addToCache(filepath);
					}

					reload('css');

				} else {

					reload();

				}


			}

		});

	}

	prevDir = dir;

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