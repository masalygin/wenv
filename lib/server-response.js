var ServerResponse = require('http').ServerResponse;

ServerResponse.prototype.sendError = function(message) {
	console.error(message);
	require('node-notifier').notify({
		title: 'wenv',
		message: message
	});
	this.status(404).send(message);
};