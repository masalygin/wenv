var glob = require('glob');
var _ = require('lodash');
var fs = require('fs-extra');
var path = require('path');
var sass = require('node-sass');


function getFileNames(filename) {
	var filenames = [];

	if (/\.scss$/.test(filename)) {
		filenames = [filename];
	} else {
		filenames = glob.sync(path.join(filename, '**/*.scss'));
	}

	return filenames;
}


function getCachePath(filename) {
	var parts;
	filename = filename.replace(/\\/g, '/');

	parts = filename.split('/resources/static/');

	if (parts.length === 2) {
		return path.join(CACHE_DIR, parts[1]);
	}

	var images = '/images/';
	parts = filename.split(images);

	if (parts.length === 2) {
		return path.join(CACHE_DIR, 'site', images, parts[1]);
	}

	throw new Error();
}


function replaceGlobal(text) {
	return text.replace(/global:\//g, '');
}


function addToCache(filename) {
	var filenames = getFileNames(filename);

	_.each(filenames, function(filename) {
		try {
			var text = fs.readFileSync(filename).toString();
			var cachePath = getCachePath(filename);
			text = replaceGlobal(text);
			fs.outputFileSync(cachePath, text);
		} catch(e) {}
	});

}


function removeFromCache(filename) {
	var filenames = getFileNames(filename);

	_.each(filenames, function(filename) {
		try {
			var cachePath = getCachePath(filename);
			fs.unlinkSync(cachePath);
		} catch(e) {}
	});

}


function clearCacheSite() {
	var dirname = path.join(CACHE_DIR, 'site');
	try {
		fs.removeSync(dirname);
	} catch(e) {}
}


function render(res, filename) {
	sass.render({
		file: filename,
		includePaths: [
			path.join(CACHE_DIR, 'site/images'),
			path.join(CACHE_DIR, 'g'),
			SASS_DIR
		],
		success: function (data) {
			res.header('Content-type', 'text/css');
			res.send(data);
		},
		error: function(err) {
			res.sendError(filename + '\n' + err);
		}
	});
}


function getFileNameInCache() {

}


module.exports = {
	getFileNames: getFileNames,
	getCachePath: getCachePath,
	replaceGlobal: replaceGlobal,
	addToCache: addToCache,
	removeFromCache: removeFromCache,
	clearCacheSite: clearCacheSite,
	render: render
};