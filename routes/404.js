var lib = require('../lib')

module.exports = function(app) {

	app.use(function (req, res) {

		lib.sendError(req.originalUrl + '\nNOT FOUND', res);

	});

};