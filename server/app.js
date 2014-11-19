var express = require('express');
var http = require('http');
var app = express();

require('./boot')(app);
require('./routes')(app);


http.createServer(app).listen(app.get('port'), app.get('ip'), function() {
	console.log('Express server listening on http://' + app.get('ip') + ':' + app.get('port'));
});