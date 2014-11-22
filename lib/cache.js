var glob = require('glob');
var _ = require('lodash');
var fs = require('fs-extra');
var path = require('path');


var sass = {};


sass.list = function(p) {

	var files;

	if (/\.scss$/.test(p)) {
		files = [p];
	} else {
		files = glob.sync(path.join(p, '**/*.scss'));
	}

	return files;

};


sass.to = function(file) {

	file = file.replace(/\\/g, '/');
	var parts;

	parts = file.split('/resources/static/');

	if (parts.length === 2) {
		return path.join(cache.dir, parts[1]);
	}

	var images = '/images/';

	parts = file.split(images);

	if (parts.length === 2) {
		return path.join(cache.dir, 'site', images, parts[1]);
	}

	throw new Error();

};


sass.replace = function(text) {
	return text.replace(/global:\//g, '');
};


sass.add = function(p) {

	var files = sass.list(p);

	_.each(files, function(from) {
		var to = sass.to(from);

		try {

			var text = fs.readFileSync(from);
			text = sass.replace(text.toString());
			fs.outputFileSync(to, text);

		} catch(e) {}

	});

};

sass.remove = function(p) {

	var files = sass.list(p);

	_.each(files, function(from) {
		var to = sass.to(from);

		try {

			fs.unlinkSync(to);

		} catch(e) {}

	});

};


var cache = {
	sass: sass
};

module.exports = cache;