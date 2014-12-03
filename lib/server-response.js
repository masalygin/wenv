var ServerResponse = require('http').ServerResponse;
var _ = require('lodash');


var messages = [];


var messagesShow = _.debounce(function() {
	var message = messages.join('\n\n***\n\n');
	console.error(message);
	require('node-notifier').notify({
		title: 'WENV',
		message: message
	});
	messages = [];
}, 250);


ServerResponse.prototype.sendError = function(message, addon) {
	messages.push(message);
	messagesShow();
	this.status(404).send(message + addon);
};