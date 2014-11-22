var http = require('http');
var io = require('socket.io')

module.exports = function(app) {

	var server = http.Server(app);
	io = io(server);

	io.listen(3001);

	app.io = io;

};