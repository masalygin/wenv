var route = require('koa-route');
var fs = require('co-fs-extra');
var co = require('co');
var path = require('path');
var content = '';


module.exports = route.all('/live.min.js', handler);


function *handler() {
  if (!content) {
    content = yield fs.readFile(path.join(__dirname, '../client/live.min.js'));
  }
  this.body = content;
  this.type = 'text/javascript';
}
