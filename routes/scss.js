var route = require('koa-route');
var sass = require('node-sass');
var path = require('path');
var dir = process.cwd();

module.exports = route.all(/.+\.scss\.css(\?.*)?/, handler);


function *handler(params, next) {
  try {
    var file = path.join(dir, this.request.path).replace(/\.css$/, '');
    var result = yield compileSass({file: file});
    this.body = result.css;
    this.type = 'text/css';
  } catch (err) {
    yield next;
  }
}


function compileSass(options) {
  options.importer = function (url, prev, done) {
    done({file: path.join(dir, 'images', url)});
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
