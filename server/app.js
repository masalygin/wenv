var express = require('express');
var config = require('nconf');
var app = express();


config.argv().env().file({file: './config.json'});

require('./boot')(app);
require('./routes')(app);


var server = app.listen(app.get('port'), function () {
	console.log('Express server listening on port ' + server.address().port);
});