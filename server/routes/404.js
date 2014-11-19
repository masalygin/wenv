var utils = require('../lib/utils')

module.exports = function(app) {

	app.use(function (req, res) {

		utils.error(req.originalUrl + '\nNOT FOUND', res);

	});

};