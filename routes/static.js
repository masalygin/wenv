var express = require('express');
var directory = require('serve-index');

module.exports = function(app) {

	var workDir = app.get('workDir');
	var staticDir = app.get('staticDir');
	var cacheDir = app.get('cacheDir');

	app.use(directory(workDir, {icons: true, view: 'details'}));

	app.use(express.static(workDir));
	app.use(express.static(staticDir));
	app.use(express.static(cacheDir));

};