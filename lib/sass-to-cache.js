var glob = require('glob');
var _ = require('lodash');
var fs = require('fs-extra');
var path = require('path');

module.exports = function(src, dest, pattern) {

	var files = glob.sync(path.join(src, pattern));

	_.each(files, function(from) {
		var to = path.join(dest, path.relative(src, from));
		var text = fs.readFileSync(from);
		text = text.toString().replace(/global:\//g, 'g/');
		fs.outputFileSync(to, text);
	});

};