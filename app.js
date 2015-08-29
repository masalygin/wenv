var koa = require('koa');
var app = koa();


module.exports = app;


app.use(require('./routes/error'));
app.use(require('./routes/scss'));
app.use(require('./routes/html'));
app.use(require('./routes/cache'));
