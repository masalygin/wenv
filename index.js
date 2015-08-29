#!/usr/bin/node --harmony

var program = require('commander');
var config = require('./lib/config');


program
  .version('2.0.0');


program
  .command('server')
  .option('-o, --open', 'Open in default browser')
  .option('-d, --dead', 'Disable livereload')
  .option('-l, --localhost', 'Local server')
  .option('-p, --port <n>', 'Port', parseInt)
  .action(function (options) {
    if (options.localhost) {
      config.ip = 'localhost';
    }
    if (options.port) {
      config.port = options.port;
    }
    if (options.dead) {
      config.liveSnippet = '';
    }
    config.mode = 'server';
    config.open = !!options.open;
    config.live = !options.dead;

    require('./server');
    if (config.live) {
      require('./lib/live');
    }

  });


program.parse(process.argv);
