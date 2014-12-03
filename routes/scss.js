var path = require('path');
var url = require('url');
var Sass = require('../lib/sass');

app.get(/^(.+\.scss\.css)(\?.*)?/, function (req, res) {

	var uri = url.parse(req.originalUrl);
	var pathname = uri.pathname.replace(/\.scss\.css$/, '.scss');
	var filename = Sass.getCachePath(pathname);
	Sass.render(res, filename);

});