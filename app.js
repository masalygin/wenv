var express = require('express');
var http = require('http');
var path = require('path');
var app = express();


app.set('workFolder', path.resolve(__dirname, '../work'));
app.set('cacheFolder', path.join(__dirname, 'cache'));
app.set('compassFolder', path.join(__dirname, 'resources/compass'));
app.set('staticFolder', path.join(__dirname, 'resources/static'));
app.set('templatesFolder', path.join(__dirname, 'resources/templates'));


require('./boot')(app);
require('./routes')(app);


http.createServer(app).listen(app.get('port'), app.get('ip'), function() {
	console.log('Express server listening on http://' + app.get('ip') + ':' + app.get('port'));
});