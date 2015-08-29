var app = require('koa')();
var config = require('./lib/config');


app.use(require('./routes/error'));
app.use(require('./routes/index'));
app.use(require('./routes/live'));
app.use(require('./routes/scss'));
app.use(require('./routes/html'));
app.use(require('./routes/static'));
app.use(require('./routes/cache'));


app.listen(config.port, config.ip, function () {
  var host = "http://" + config.ip + ":" + config.port;
  console.log("Server listening on " + host);
  if (config.open) {
    require('opener')(host);
  }
});


if (config.live) {
  var io = require('socket.io')(app);
  io.listen(config.socketPort);
  app.io = io;
}


module.exports = app;
