var express = require('express');
var http = require('http');
var ip = require('ip');
var path = require('path');
var Sass = require('./lib/sass');
var fs = require('fs-extra');
var ua = require('universal-analytics');

var config = fs.readJSONSync('./config.json');

global.WORK_DIR =  path.resolve(__dirname, config.workdir);
global.CACHE_DIR = path.join(__dirname, config.cache);
global.SASS_DIR = path.join(__dirname, config.mixins);
global.STATIC_DIR = path.join(__dirname, config.static);
global.TEMPLATES_DIR = path.join(__dirname, config.templates);
global.SMARTY_INDEX = path.join(__dirname, config.smarty_index);
global.PORT = process.env.PORT || 3000;
global.IP = ip.address();


require('./lib/find-php');
require('./lib/server-response');

global.app = express();
app.use(require('static-favicon')());
app.use(require('morgan')('dev'));
app.use(require('body-parser').json());
app.use(require('body-parser').urlencoded());
app.use(require('cookie-parser')());

app.visitor = ua('UA-57663644-1');
app.visitor.event('start', process.env.USERNAME + ': ' + IP).send();

app.io = require('socket.io')(require('http').Server(app));
app.io.listen(3001);


fs.removeSync(CACHE_DIR);
Sass.addToCache(STATIC_DIR);
fs.ensureDirSync(path.join(CACHE_DIR, 'templates_c'));
fs.ensureDirSync(WORK_DIR);


require('./routes');


http.createServer(app).listen(PORT, IP, function() {
	console.log('Express server listening on http://' + IP + ':' + PORT);
});