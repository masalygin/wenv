var fs = require('fs');
var notifier = require('node-notifier');
var config = require('nconf');
var utils = require('../utils');
var path = require('path');
var Collector = require('fcollector');

var aliases = config.get('aliases');

function replaceAliases(data) {
	for (var key in aliases) {
		data = data.replace(new RegExp(utils.regExpEscape(key), 'g'), aliases[key]);
	}
	return data;
}


var smarty = config.get('smarty');
var smartyRegExp = new RegExp('(\\{\\/?(' + smarty.join('|') + ')[^\\}]*\\})', 'g');

function replaceSmarty(data) {
	return data.replace(smartyRegExp, '');
}





module.exports = function (app) {


	app.get(/^(.+\.(html|tpl))$/, function (req, res) {

		var filepath = './client/sites' + req.originalUrl;
		var dir = path.dirname(filepath);
		var isScssReady = false;
		var isHtmlReady = false;
		var html = '';

		function error(err) {
			console.log(err);
			notifier.notify({
				title: 'wenv',
				message: filepath + '\n' + err
			});
			res.status(404).send('404');
		}


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

			main: filepath,

			success: function(data) {

				html = replaceAliases(data);
				html = replaceSmarty(html);
				isHtmlReady = true;
				send();

			},

			error: error,

			pipe: function(data) {

				var self = this;
				var sub = [];

				data = data.replace(/\{include\s+file="(db|global):([^"]+)"[^\}]*\}/g, function(include, resource, filename) {

					var filepath = path.resolve(dir, filename);

					sub.push({
						filepath: filepath,
						include: include
					});

					return self.label + filepath;

				});

				return {
					data: data,
					sub: sub
				};

			}
		});

	});


};