var path = require('path');
var url = require('url');
var Watcher = require('../lib/watcher');
var Smarty = require('../lib/smarty');

app.all(/^.+\.(html|tpl)(\?.*)?$/, function (req, res) {

	var uri = url.parse(req.originalUrl);
	var filepath = path.join(WORK_DIR, uri.pathname);
	var dir = path.dirname(filepath);
	var filename = path.basename(filepath);

	Watcher.setDir(dir);

	new Smarty(res, {
		_GET: req.query,
		_POST: req.body,
		_COOKIE: req.cookies,
		FILENAME: filename,
		WORK_DIR: dir + '/',
		TEMPLATES_DIR: TEMPLATES_DIR + '/',
		CACHE_DIR: CACHE_DIR + '/'
	});

});