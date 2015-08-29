var chokidar = require('chokidar');
var _ = require('lodash');
var server = require('../server');
var dir = process.cwd();
var isReady = false;


var reload = _.throttle(function() {
  server.io.emit('reload');
}, 500);


var reloadCSS = _.throttle(function() {
  server.io.emit('reload', 'css');
}, 500);


watcher = chokidar.watch(dir, {
  ignored: /[\/\\]\./,
  ignorePermissionErrors: true,
  persistent: true
});


watcher.on('ready', function() {
  isReady = true;
});


watcher.on('all', function(e, file) {
  if (isReady && (e == 'add' || e == 'change' || e == 'unlink')) {
    if (/\.scss$/.test(file)) {
      reloadCSS();
    } else {
      reload();
    }
  }
});
