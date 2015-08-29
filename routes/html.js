var route = require('koa-route');
var fs = require('co-fs-extra');
var path = require('path');
var dir = process.cwd();
var snippet = '\n\n\n<script src="/live.min.js"></script>';


module.exports = route.all(/.+\.(html|tpl)(\?.*)?/, handler);


function *handler() {
  var file = path.join(dir, this.request.path);
  var body = yield fs.readFile(file, 'utf8');
  this.body = body + snippet;
}
