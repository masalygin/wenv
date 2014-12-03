var url = require('url');
var path = require('path');
var Sass = require('../lib/sass');
var Watcher = require('../lib/watcher');

app.get(/^(.+\.scss\.css)(\?.*)?/, function (req, res) {

	var uri = url.parse(req.originalUrl);
	var pathname = uri.pathname.replace(/\.scss\.css$/, '.scss');
	var dir = path.join(WORK_DIR, pathname.split('/images/')[0]);
	var filename = Sass.getCachePath(pathname);

	Watcher.setDir(dir);
	Sass.render(res, filename);

});