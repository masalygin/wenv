var express = require('express');
var path = require('path');

module.exports = function(app) {

	app.use(express.static('./client/sites'));
	app.use(express.static('./client/public'));

};