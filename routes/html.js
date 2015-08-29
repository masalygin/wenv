route = require('koa-route');
fs = require('co-fs-extra');
path = require('path');
dir = process.cwd();


module.exports = route.all(/.+\.(html|tpl)(\?.*)?/, handler);


function *handler() {
	var filepath = path.join(dir, this.request.path);
	this.body = yield fs.readFile(filepath, 'utf8');
}
