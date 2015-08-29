var send = require('koa-sendfile');
var cache = require('../lib/cache');


module.exports = handler;


function *handler() {
  var file = yield cache(this.request.path);
  yield* send.call(this, file);
}
