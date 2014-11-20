module.exports = function(app) {
	require('./express')(app);
	require('./cache')(app);
	require('./www')(app);
};