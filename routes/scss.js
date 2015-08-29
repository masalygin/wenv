var route = require('koa-route');
var sass = require('node-sass');
var path = require('path');
var fs = require('co-fs-extra');
var cache = require('../lib/cache');
var dir = process.cwd();


module.exports = route.all(/.+\.scss\.css(?:\?.*)?/, handler);


function *handler(next) {
  var file = path.join(dir, this.request.path).replace(/\.css$/, '');
  var exists = yield fs.exists(file);
  if (exists) {
    var result = yield compileSass({file: file});
    this.body = result.css;
    this.type = 'text/css';
  } else {
    yield next;
  }
}


function compileSass(options) {
  options.importer = function (file, prev, done) {
    if (file.indexOf('global:') === 0) {
      file = path.join('/g/', file.slice(7));
      cache(file).then(function(file) {
        done({file: file});
      }).catch(function(err) {
        done(err);
      });
    } else {
      done({file: path.join(dir, 'images', file)});
    }
  };
  return new Promise(function (resolve, reject) {
    sass.render(options, function (err, data) {
      if (err) {
        return reject(err);
      }
      resolve(data);
    });
  });
}
