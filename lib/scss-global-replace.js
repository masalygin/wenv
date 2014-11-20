var glob = require('glob');
var _ = require('lodash');
var fs = require('fs-extra');
var path = require('path');

module.exports = function(src, dest, pattern) {

	var files = glob.sync(path.join(src, pattern));

	_.each(files, function(filename) {
		var text = fs.readFileSync(filename);
		text = text.toString().replace(/global:\//g, '');
		console.log(path.relative(src, dest), filename);
		//fs.writeFileSync();
	});

};