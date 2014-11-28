var lib = require('../lib')

app.use(function (req, res) {
	lib.sendError(req.originalUrl + '\nNOT FOUND', res);
});