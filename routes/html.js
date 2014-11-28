var config = require('../config');
var lib = require('../lib');
var path = require('path');
var url = require('url');
var _ = require('lodash');
var chokidar = require('chokidar');
var exec = require('child_process').exec;


function replace(text, aliases) {

	aliases = aliases || config.replace['*'];

	_.each(aliases, function(val, key) {
		text = text.replace(new RegExp(lib.regexpEscape(key), 'g'), val);
	});

	return text;
}


function replaceByGet(text, query) {

	var GET = config.replace['get'];

	_.each(query, function(val, key) {
		if (GET[key]) {
			if (GET[key][val]) {
				text = replace(text, GET[key][val]);
			}
		}
	});

	return text;
}


var smartyTagsRegExp = new RegExp('(\\{\\/?(' + config.replace.smarty.join('|') + ')[^\\}]*\\})', 'g');;

function removeSmartyTags(text) {
	return text.replace(smartyTagsRegExp, '');
}


var prevDir = null;
var watcher = null;

var reload = _.debounce(function(type) {

	app.io.emit('reload', type);

}, 500);


app.get(/^.+\.(html|tpl)(\?.*)?$/, function (req, res) {

	var uri = url.parse(req.originalUrl);
	var filepath = path.join(WORK_DIR, uri.pathname);
	var dir = path.dirname(filepath);

	if (prevDir != dir) {

		if (watcher) {
			watcher.close();
		}

		lib.cache.sass.add(dir);

		watcher = chokidar.watch(dir, {
			ignored: /[\/\\]\./,
			ignorePermissionErrors: true,
			persistent: true
		});

		watcher.on('all', function(event, filepath) {

			if (event == 'add' || event == 'change' || event == 'unlink') {


				if (/\.scss$/.test(filepath)) {

					if (event == 'unlink') {
						lib.cache.sass.remove(filepath);
					} else {
						lib.cache.sass.add(filepath);
					}

					reload(filepath);

				} else {

					reload();

				}


			}

		});

	}

	prevDir = dir;


	var command = ['C:/PHP/php'];
	command.push(SMARTY_COMMAND);
	command.push(filepath);
	command.push(dir);
	command.push(TEMPLATES_DIR);
	command.push(CACHE_DIR);

	command = command.join(' ');

	var smarty = exec(command, function(error, stdout, stderr) {

		stdout = removeSmartyTags(stdout);
		stdout += '<script src="/wenv/socket.io.js"></script><script src="/wenv/livereload.js"></script>';

		res.send(stdout);

		if (error || stderr) {
			lib.sendError(uri.pathname + '\n' + error + '\n' + stderr, res);
		}
	});

});