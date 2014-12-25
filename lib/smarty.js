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

	var self = this;
	var time;

	if (this.options._GET.hasOwnProperty('sl')) {
		time = Date.now();
		fs.readFile(path.join(this.options.WORK_DIR, this.options.FILENAME), function(err, body) {
			if (err) {
				self.res.sendError('Ошибка: ' + err, livereloadSnippet);
			} else {
				app.visitor.timing('compile', 'sl', Date.now() - time).send();
				self.res.send(replaceSmartyTags(body.toString()) + livereloadSnippet);
			}

		});
		return;
	}

	this.options.DATA = fs.readJsonSync(path.join(this.options.WORK_DIR, 'smarty.json'), {throws: false}) || {};

	if (this.options._GET.smarty && !this.options.SMARTY_DATA_FILE) {
		this.loadDump(_.bind(this.render, this));
		return;
	}

	if (this.options._GET.view) {
		this.options.DATA.shop2 = this.options.DATA.shop2 || {};
		this.options.DATA.shop2.view = this.options._GET.view;
	}

	var options = encodeURIComponent(JSON.stringify(this.options));
	var command = [PHP_COMMAND];
	command.push(SMARTY_INDEX);
	command.push(options);
	command = command.join(' ');

	time = Date.now();
	exec(command, function(err, stdout) {
		if (err) {
			self.res.sendError('Ошибка Smarty: ' + stdout, livereloadSnippet);
		} else {
			app.visitor.timing('compile', 'smarty', Date.now() - time).send();
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
				body = _.unescape(body);

			} catch (e) {}
			fs.outputFileSync(filepath, body);
			self.options.SMARTY_DATA_FILE = filepath;
			callback();
		}
	});

};

function replaceSmartyTags(body) {
	return body.replace(/(\{\/?(if|foreach|capture|section|literal|strip|else|elseif|foreachelse|sectionelse)[^\}]*\})/g, '');
}


module.exports = Smarty;