var fs = require('fs-extra');

module.exports = function(app) {

	var workDir = app.get('workDir');
	fs.ensureDirSync(workDir);

};