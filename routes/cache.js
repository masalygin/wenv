var send = require('koa-sendfile');
var requiest = require('request');
var fs = require('co-fs-extra');
var url = require('url');
var path = require('path');

module.exports = handler;


function *handler(next) {
  var file = yield fetch(this.request.path);
  yield* send.call(this, file);
  if (!this.status) {
    yield next;
  }
}


function fetch(file) {
  var uri = url.resolve('http://dumper.demojs0.oml.ru/', file);
  return new Promise(function(resolve, reject) {
    var stream = requiest.get(uri);
    stream.on('error', reject);
    stream.on('response', function(response) {
      if (response.statusCode !== 200) {
        reject(new Error('Not found: ' + uri));
        this.abort();
        return;
      }
      file = path.join(__dirname, '../cache', file);
      fs.ensureDirSync(path.dirname(file));
      var writeStream = fs.createWriteStream(file);
      writeStream.on('finish', function() {
        resolve(file);
      });
      this.pipe(writeStream);
    });
  });
}
