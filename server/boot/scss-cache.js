var del = require('del');
var utils = require('../utils');

module.exports = function(app) {

	del('./.cache', function() {

		utils.replace({
			glob: './client/resources/g/**/*.scss',
			dest: './.cache/g/',
			search: /global:\//g,
			replacement: ''
		});

	});

};