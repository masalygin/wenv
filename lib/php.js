var fs = require('co-fs-extra');
var co = require('co');
var path = require('path');
var os = require('os');


module.exports = co(function *() {
  if (os.platform() == 'linux') {
    return yield Promise.resolve('/usr/bin/php');
  }
  var dirs = process.env.PATH.split(';');
  dirs.unshift('C:/PHP/');
  var file = 'php.exe';
  var exist;
  var php;
  for (var i = 0, len = dirs.length; i < len; i++) {
    php = path.join(dirs[i], file);
    exist = fs.exists(php);
    if (exist) {
      return yield Promise.resolve(php);
    }
  }
  return yield Promise.reject(new Error('PHP not found'));
});
