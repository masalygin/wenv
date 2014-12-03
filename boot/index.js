var bodyParser = require('body-parser');
var fs = require('fs-extra');
var Sass = require('../lib/sass');
var path = require('path');


app.use(require('static-favicon')());
app.use(require('morgan')('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded());
app.use(require('cookie-parser')());


var server = require('http').Server(app);
app.io = require('socket.io')(server);
app.io.listen(3001);


fs.removeSync(CACHE_DIR);
Sass.addToCache(STATIC_DIR);
fs.ensureDirSync(path.join(CACHE_DIR, 'templates_c'));
fs.ensureDirSync(WORK_DIR);