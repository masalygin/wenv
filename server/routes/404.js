var notifier = require('node-notifier');

module.exports = function(app) {

	app.use(function (req, res, next) {

		notifier.notify({
			title: 'wenv',
			message: req.originalUrl + '\nNOT FOUND'
		});

		res.status(404).end();

	});

};