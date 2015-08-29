var koa = require('koa');
var route = require('koa-route');
var fs = require('co-fs-extra');
var sass = require('node-sass');
var app = koa();
var dir = process.cwd();
var path = require('path');

module.exports = app;

//re =
//	scss: /.+\.scss\.css(\?.*)?/
//	html: /.+\.(html|tpl)(\?.*)?/


app.use(require('./routes/html'));


//#app.use route.all re.scss, ()->
//#	options =
//#		file: path.join dir, @request.path
//#	@body = yield compileSass options
//#	yield []
//#
//#
//#app.use route.get('/wenv', ()->
//#	@body = '777'
//#	yield []
//#)
//#
//#
//#compileSass = (options) ->
//#	new Promise (resolve, reject)->
//#		sass.render options, (err, data)->
//#			return reject err if err
//#			resolve data
