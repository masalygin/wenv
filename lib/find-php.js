var fs = require('fs-extra');
var path = require('path');

var parts = process.env.PATH.split(';');
var filename = 'php.exe';
var php_command;

parts.unshift('C:/PHP/');

for (var i = 0, len = parts.length; i < len; i++) {
	var filepath = path.join(parts[i], filename);
	if (fs.existsSync(filepath)) {
		php_command = filepath;
		console.log('PHP найден в ' + parts[i]);
		break;
	}
}

if (!php_command) {
	console.log('PHP НЕ найден в ' + parts[i]);
}

global.PHP_COMMAND = php_command || null;