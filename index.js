#!/usr/bin/node --harmony

var program = require('commander');
var ip = require('ip').address();
var port = 3000;
var app = require('./app.js');


program
	.version('2.0.0');


program
	.command('start')
	.action(function() {
		app.listen(port, ip, function() {
			console.log("Server listening on http://" + ip + ":" + port);
		});
	});


program.parse(process.argv);
