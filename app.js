var express = require('express');
var http = require('http');
var ip = require('ip');
var path = require('path');
var app = express();


app.set('port', process.env.PORT || 3000);
app.set('ip', ip.address());

app.set('workDir', path.resolve(__dirname, '../www'));
app.set('cacheDir', path.join(__dirname, 'cache'));
app.set('sassDir', path.join(__dirname, 'resources/sass'));
app.set('staticDir', path.join(__dirname, 'resources/static'));
app.set('templatesDir', path.join(__dirname, 'resources/templates'));


require('./boot')(app);
require('./routes')(app);


http.createServer(app).listen(app.get('port'), app.get('ip'), function() {
	console.log('Express server listening on http://' + app.get('ip') + ':' + app.get('port'));
});