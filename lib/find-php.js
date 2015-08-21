var fs = require('fs-extra');
var path = require('path');
var os = require('os');

function linux() {
	return '/usr/bin/php';
}

function windows() {
	var parts = process.env.PATH.split(';');
	var filename = 'php.exe';
	parts.unshift('C:/PHP/');

	for (var i = 0, len = parts.length; i < len; i++) {
		var filepath = path.join(parts[i], filename);
		if (fs.existsSync(filepath)) {
			return filepath;
		}
	}
}

var php_command = (os.platform() == 'linux') ? linux() : windows();

if (php_command) {
	global.PHP_COMMAND = '"' + php_command + '"';
} else {
	console.log('PHP НЕ найден');
	global.PHP_COMMAND = null;
}