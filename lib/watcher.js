var chokidar = require('chokidar');
var Sass = require('./sass');
var _ = require('lodash');


var isReady = false;
var currentDir;
var watcher;


var reload = _.throttle(function() {
	app.io.emit('reload');
}, 500);


var reloadCSS = _.throttle(function() {
	app.io.emit('reload', 'css');
}, 500);


function changeSass(eventName, filepath) {
	if (eventName == 'unlink') {
		Sass.removeFromCache(filepath);
	} else {
		Sass.addToCache(filepath);
	}
	reloadCSS();
}


function change(eventName, filepath) {
	reload();
}


function setDir(dir) {

	if (dir == currentDir) {
		return;
	}

	if (watcher) {
		watcher.close();
	}

	Sass.clearCacheSite();
	Sass.addToCache(dir);

	isReady = false;

	watcher = chokidar.watch(dir, {
		ignored: /[\/\\]\./,
		ignorePermissionErrors: true,
		persistent: true
	});

	watcher.on('ready', function() {
		isReady = true;
	});

	watcher.on('all', function(eventName, filepath) {
		if (isReady && (eventName == 'add' || eventName == 'change' || eventName == 'unlink')) {
			if (/\.scss$/.test(filepath)) {
				changeSass(eventName, filepath);
			} else {
				change(eventName, filepath);
			}
		}
	});

	currentDir = dir;

}


module.exports = {
	setDir: setDir
};
