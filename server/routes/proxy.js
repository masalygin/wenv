var proxy = require('express-http-proxy');
var url = require('url');
var fs = require('fs');
var extra = require('fs-extra');
var path = require('path');

module.exports = function(app) {

	app.use('/', proxy('megagroup.ru', {

		forwardPath: function(req, res) {
			return url.parse(req.url).path;
		}

	}));

};