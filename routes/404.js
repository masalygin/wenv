app.use(function (req, res) {
	res.sendError(req.originalUrl + '\nNOT FOUND');
});