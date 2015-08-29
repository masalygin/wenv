var send = require('koa-sendfile');
var cache = require('../lib/cache');
var dir = process.cwd();
var path = require('path');


module.exports = handler;


function *handler(next) {
  var file = path.join(dir, this.request.path);
  yield* send.call(this, file);
  if (this.status === 404) {
    yield next;
  }
}
