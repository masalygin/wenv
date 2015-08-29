var prettyjson = require('prettyjson');
var config = require('../lib/config');


module.exports = handler;


function *handler(next) {
  try {
    yield next;
  } catch (err) {
    delete err.stack;
    this.body = '<h1>Error</h1>' +
      '<pre>' + prettyjson.render(err, {noColor: true}) + '</pre>' +
      config.liveSnippet
    ;
    this.status = 404;
  }
}
