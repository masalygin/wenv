module.exports = function(message, res) {

	console.error(message);

	notifier.notify({
		title: 'wenv',
		message: message
	});

	res.status(404).send(message);

};