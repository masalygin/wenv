#!/usr/bin/node --harmony

program = require('commander');
ip = require('ip').address();
port = 3000;
app = require('./app.js');


program
	.version('2.0.0');


program
	.command('start')
	.action(function() {
		app.listen(port, ip, function() {
			console.log("Server listening on http://#{ip}:#{port}");
		});
	});


program.parse(process.argv);
