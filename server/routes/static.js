var express = require('express');
var directory = require('serve-index');

module.exports = function(app) {

	app.use(directory('./client/sites', {
		icons: true,
		view: 'details'
	}));

	app.use(express.static('./client/sites'));
	app.use(express.static('./client/resources'));

};