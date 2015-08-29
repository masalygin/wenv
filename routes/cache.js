var send = require('koa-sendfile');


module.exports = handler;


function *handler() {
  console.log('a', this.status);
}
