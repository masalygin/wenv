var express = require('express');
var http = require('http');
var ip = require('ip');
var path = require('path');

require('./lib/server-response');

global.app = express();

global.WORK_DIR =  path.resolve(__dirname, '../www');
global.CACHE_DIR = path.join(__dirname, 'cache');
global.SASS_DIR = path.join(__dirname, 'resources/sass');
global.STATIC_DIR = path.join(__dirname, 'resources/static');
global.TEMPLATES_DIR = path.join(__dirname, 'resources/templates');
global.SMARTY_COMMAND = path.join(__dirname, 'Smarty/index.php');
global.PORT = process.env.PORT || 3000;
global.IP = ip.address();

require('./boot');
require('./routes');


http.createServer(app).listen(PORT, IP, function() {
	console.log('Express server listening on http://' + IP + ':' + PORT);
});