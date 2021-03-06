var route = require('koa-route');
var fs = require('co-fs-extra');
var exec = require('co-exec');
var path = require('path');
var cookie = require('cookie');
var config = require('../lib/config');
var php = require('../lib/php');
var dir = path.join(process.cwd(), '/');
var wenv = path.join(__dirname, '../');
var index = path.join(wenv, '/Smarty/index.php');
var template_c = path.join(wenv, '/.tmp/template_c/');
var global = path.join(wenv, '/.tmp/global/');
var paramsFile = path.join(dir, '.wenv.tmp');


module.exports = route.all(/.+\.(html|tpl)(\?.*)?/, handler);


function *handler() {
  var params = {
    file: this.request.path,
    dir: dir,
    global: global,
    wenv: wenv,
    template_c: template_c,
    _GET: this.request.query,
    _POST: this.request.body,
    _COOKIE: cookie.parse(this.request.headers.cookie || '')
  };
  var exe = yield php;
  yield fs.ensureDir(template_c);
  yield fs.outputJson(paramsFile, params);
  var body = yield exec(exe + ' ' + index + ' ' + dir);
  this.body = body + config.liveSnippet;
  yield fs.remove(paramsFile);
}
