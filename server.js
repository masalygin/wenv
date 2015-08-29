var app = require('koa')();
var io = require('socket.io')(app);
var ip = require('ip').address();
var port = 3000;
var socketPort = 3001;


app.use(require('./routes/error'));
app.use(require('./routes/live'));
app.use(require('./routes/scss'));
app.use(require('./routes/html'));
app.use(require('./routes/cache'));


app.listen(port, ip, function () {
  console.log("Server listening on http://" + ip + ":" + port);
});

io.listen(socketPort);

app.io = io;

module.exports = app;
