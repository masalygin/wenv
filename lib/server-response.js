var ServerResponse = require('http').ServerResponse;
var _ = require('lodash');
var chalk = require('chalk');


var messages = [];


var messagesShow = _.debounce(function() {
	var delimiter = '\n\n***\n\n';
	var message = messages.join(delimiter);
	console.log(chalk.bold.red(delimiter + message + delimiter));
	require('node-notifier').notify({
		title: 'WENV',
		message: message
	});
	messages = [];
}, 250);


ServerResponse.prototype.sendError = function(message, addon) {
	addon = addon || '';
	messages.push(message);
	messagesShow();
	this.status(404).send(message + addon);
};