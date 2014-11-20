var http = require('http');
var io = require('socket.io')

module.exports = function(app) {

	var server = http.Server(app);
	io = io(server);

	io.listen(80);

	io.on('connection', function (socket) {

		app.socket = socket;

	});

};