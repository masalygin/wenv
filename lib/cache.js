var send = require('koa-sendfile');
var requiest = require('request');
var fs = require('co-fs-extra');
var url = require('url');
var path = require('path');
var co = require('co');


var cache = co.wrap(function *(file) {
  var local = path.join(__dirname, '../.tmp/cache', file);
  var localExists = yield fs.exists(local);
  if (localExists) {
    return yield Promise.resolve(local);
  }
  var remote = url.resolve('http://dumper.demojs0.oml.ru/', file);
  var loaded = false;
  try {
    loaded = yield load(remote, local);
  } catch (e) {}
  if (loaded) {
    return yield Promise.resolve(local);
  }
  return yield Promise.reject(new Error('Not found: ' + file));
});


var load = function(from, to) {
  return new Promise(function(resolve, reject) {
    var stream = requiest.get(from);
    stream.on('error', reject);
    stream.on('response', function(response) {
      if (response.statusCode !== 200) {
        reject();
        this.abort();
        return;
      }
      fs.ensureDirSync(path.dirname(to));
      var writeStream = fs.createWriteStream(to);
      writeStream.on('finish', function() {
        resolve(true);
      });
      this.pipe(writeStream);
    });
  });
};


module.exports = cache;
