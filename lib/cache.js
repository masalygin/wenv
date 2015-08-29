var send = require('koa-sendfile');
var requiest = require('request');
var fs = require('co-fs-extra');
var url = require('url');
var path = require('path');


module.exports = {
  remote: remote,
  local: local,
  fetch: fetch
};


function remote(file) {
  return url.resolve('http://dumper.demojs0.oml.ru/', file)
}


function local(file) {
  return path.join(__dirname, '../cache', file);
}


function fetch(file) {
  return new Promise(function(resolve, reject) {
    var uri = remote(file);
    var stream = requiest.get(uri);
    stream.on('error', reject);
    stream.on('response', function(response) {
      if (response.statusCode !== 200) {
        reject(new Error('Not found: ' + uri));
        this.abort();
        return;
      }
      file = local(file);
      fs.ensureDirSync(path.dirname(file));
      var writeStream = fs.createWriteStream(file);
      writeStream.on('finish', function() {
        resolve(file);
      });
      this.pipe(writeStream);
    });
  });
}
