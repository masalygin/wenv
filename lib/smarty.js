var exec = require('child_process').exec;
var fs = require('fs-extra');
var request = require('request');
var path = require('path');
var _ = require('lodash');
var livereloadSnippet = '\n\n\n\n<script src="/wenv/livereload.min.js"></script>';


function Smarty(res, options) {
	this.res = res;
	this.options = options;
	this.render();
}

Smarty.prototype.render = function() {

	if (this.options._GET.smarty && !this.options.SMARTY_DATA_FILE) {
		this.loadDump(_.bind(this.render, this));
		return;
	}

	var options = encodeURIComponent(JSON.stringify(this.options));
	var self = this;
	var command = ['C:/PHP/php'];
	command.push(SMARTY_COMMAND);
	command.push(options);
	command = command.join(' ');

	exec(command, function(err, stdout) {
		if (err) {
			self.res.sendError('Ошибка Smarty: ' + stdout, livereloadSnippet);
		} else {
			self.res.send(stdout + livereloadSnippet);
		}
	});

};


Smarty.prototype.loadDump = function(callback) {

	var url = this.options._GET.smarty;
	var filename = encodeURIComponent(url);
	var filepath = path.join(CACHE_DIR, 'smarty_data', filename);
	var exists = fs.existsSync(filepath);

	if (exists) {
		this.options.SMARTY_DATA_FILE = filepath;
		callback();
		return;
	}

	var self = this;

	request(url, function(err, response, body) {
		if (err || response.statusCode !== 200) {
			self.res.sendError('Not found:\n' + url);
		} else {
			try {

				body = '<?php\nreturn ' + body.trim().split('\n').slice(3, -2).join('\n').slice(5, -6) + ';';
				body = body.replace(/\s+[A-Za-z0-9\\]+::__set_state\(/g, '');
				body = body.replace(/\s+\)\),\n/g, '),\n');

			} catch (e) {}
			fs.outputFileSync(filepath, body);
			self.options.SMARTY_DATA_FILE = filepath;
			callback();
		}
	});

};


module.exports = Smarty;