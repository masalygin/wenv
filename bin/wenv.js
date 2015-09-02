#!/usr/bin/env node

require('harmonize')();
var program = require('commander');
var config = require('../lib/config');
var pkg = require('../package.json');


program
  .version(pkg.version);


program
  .command('server')
  .option('-o, --open', 'Open in default browser')
  .option('-c, --csscomb', 'Use CSScomb')
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
    if (options.csscomb) {
      config.csscomb = true;
    }
    config.mode = 'server';
    config.open = !!options.open;
    config.live = !options.dead;

    require('../server');
    if (config.live) {
      require('../lib/live');
    }

  });


program.parse(process.argv);
