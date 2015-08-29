var fs = require('co-fs-extra');
var route = require('koa-route');


module.exports = route.all('/', handler);


function *handler(next) {
  var extensions = ['html', 'htm', 'tpl'];
  var file, exist, i, len;
  for (i = 0, len = extensions.length; i < len; i++) {
    file = './index.' + extensions[i];
    exist = yield fs.exists(file);
    if (exist) {
      this.redirect(file);
      return;
    }
  }
  yield next;
}
