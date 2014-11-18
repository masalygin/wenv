var express = require('express');
var config = require('nconf');
var http = require('http');
var app = express();


config.argv().env().file({file: './config.json'});

require('./boot')(app);
require('./routes')(app);


http.createServer(app).listen(app.get('port'), app.get('ip'), function() {
	console.log('Express server listening on http://' + app.get('ip') + ':' + app.get('port'));
});