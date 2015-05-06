var url = require('url');
var path = require('path');
var Sass = require('../lib/sass');
var Watcher = require('../lib/watcher');
var fs = require('fs');

app.get(/^(.+\.scss\.css)(\?.*)?/, function (req, res, next) {

	var uri = url.parse(req.originalUrl);
	var pathname = uri.pathname.replace(/\.scss\.css$/, '.scss');
	var dir = path.join(WORK_DIR, pathname.split('/images/')[0]);
	var filename = Sass.getCachePath(pathname);

	if (filename && fs.existsSync(filename)) {
		Watcher.setDir(dir);
		Sass.render(res, filename);	
	} else {
		next();
	}

});
