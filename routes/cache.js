var send = require('koa-sendfile');
var cache = require('../lib/cache');


module.exports = handler;


function *handler(next) {
  var file = cache.local(this.request.path);
  yield* send.call(this, file);
  if (this.status !== 404) {
    return;
  }
  yield cache.fetch(this.request.path);
  yield* send.call(this, file);
  if (!this.status) {
    this.throw(404);
  }
}
