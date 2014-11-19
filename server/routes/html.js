var config = require('../../config.json');
var utils = require('../lib/utils');
var path = require('path');
var Collector = require('../lib/fcollector');
var url = require('url');
var _ = require('lodash');

function replaceAliases(data, aliases) {
	aliases = aliases || config['aliases'];
	_.each(aliases, function(val, key) {
		data = data.replace(new RegExp(utils.regExpEscape(key), 'g'), val);
	});
	return data;
}


var smartyRegExp = new RegExp('(\\{\\/?(' + config['smarty'].join('|') + ')[^\\}]*\\})', 'g');

function replaceSmarty(data) {
	return data.replace(smartyRegExp, '');
}


var GET = config['get'];

function replaceByGet(data, query) {
	_.each(query, function(val, key) {
		if (GET[key]) {
			if (GET[key][val]) {
				data = replaceAliases(data, GET[key][val]);
			}
		}
	});
	return data;
}


module.exports = function (app) {

	app.get(/^.+\.(html|tpl)(\?.*)?$/, function (req, res) {

		var uri = url.parse(req.originalUrl);
		var filepath = './client/sites' + uri.pathname;
		var dir = path.dirname(filepath);
		var isScssReady = false;
		var isHtmlReady = false;
		var html = '';

		function send() {
			if (isScssReady && isHtmlReady) {
				res.send(html);
			}
		}


		utils.replace({
			glob: dir + '/**/*.scss',
			dest: '.cache/site/',
			search: /global:\//g,
			replacement: ''
		}).on('end', function() {
			isScssReady = true;
			send();
		});


		new Collector({

			altPath: './client/resources/tpl',

			main: filepath,

			success: function(data) {

				html = replaceSmarty(data);
				isHtmlReady = true;
				send();

			},

			error: function(err) {

				utils.error(uri.pathname + '\n' + err, res);

			},

			pipe: function(data) {

				var self = this;
				var sub = [];

				data = replaceByGet(data, req.query);
				data = replaceAliases(data);

				data = data.replace(/\{include\s+file="(db|global):([^"]+)"[^\}]*\}/g, function(include, resource, filename) {

					var s = {};
					s.filepath = path.resolve(dir, filename);
					s.include = include;

					if (resource === 'global') {
						s.altpath = path.resolve(self.altPath, filename);
					}

					sub.push(s);

					return self.label + s.filepath;

				});

				return {
					data: data,
					sub: sub
				};

			}
		});

	});


};