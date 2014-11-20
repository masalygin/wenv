module.exports = function(app) {
	require('./express')(app);
	require('./livereload')(app);
	require('./cache')(app);
	require('./www')(app);
};