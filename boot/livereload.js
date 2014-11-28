var http = require('http');

var server = http.Server(app);
app.io = require('socket.io')(server);
app.io.listen(3001);