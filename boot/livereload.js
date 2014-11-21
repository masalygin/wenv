var http = require('http');
var io = require('socket.io')

module.exports = function(app) {

	var server = http.Server(app);
	io = io(server);

	io.listen(80);

	app.io = io;

};