module.exports = function(app) {
	require('./scss')(app);
	require('./html')(app);
	require('./static')(app);
	require('./proxy')(app);
	require('./404')(app);
};