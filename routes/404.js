app.use(function (req, res) {
	res.sendError('Not found:\n' + req.originalUrl);
});