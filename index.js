#!/usr/bin/node --harmony

var program = require('commander');


program
  .version('2.0.0');


program
  .command('start')
  .option('-o, --open', 'Open in default browser')
  .option('-d, --dead', 'Disable livereload')
  .action(function (options) {
    var server = require('./server');

    if (options.open) {
      server.started.then(function(host) {
        require('opener')(host);
      });
    }

    if (!options.dead) {
      require('./lib/live');
    }

  });


program.parse(process.argv);
