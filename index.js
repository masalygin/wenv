#!/usr/bin/node --harmony

var program = require('commander');


program
  .version('2.0.0');


program
  .command('start')
  .action(function () {
    require('./server');
    require('./lib/live');
  });


program.parse(process.argv);
