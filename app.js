var koa = require('koa');
var route = require('koa-route');
var fs = require('co-fs-extra');
var sass = require('node-sass');
var app = koa();
var dir = process.cwd();
var path = require('path');

module.exports = app;


app.use(require('./routes/error'));
app.use(require('./routes/scss'));
app.use(require('./routes/html'));
//app.use(require('./routes/cache'));
