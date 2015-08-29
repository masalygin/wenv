var route = require('koa-route');
var fs = require('co-fs-extra');
var path = require('path');
var dir = process.cwd();


module.exports = route.all(/.+\.(html|tpl)(\?.*)?/, handler);


function *handler() {
  var file = path.join(dir, this.request.path);
  this.body = yield fs.readFile(file, 'utf8');
}
