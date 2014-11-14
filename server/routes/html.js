var fs = require('fs');
var notifier = require('node-notifier');
var config = require('nconf');
var utils = require('../utils');

var aliases = config.get('aliases');
var smarty = config.get('smarty');

function replaceAliases(data) {
	for (var key in aliases) {
		data = data.replace(new RegExp(utils.regExpEscape(key), 'g'), aliases[key]);
	}
	return data;
}

function createSmartyRegExp() {
	var str =
		'(' +
		'\\{\\/?(' + smarty.double.join('|') + ')[^\\}]*\\}' +
		'|' +
		'\\{(' + smarty.single.join('|') + ')[^\\}]*\\}' +
		')';
	return new RegExp(str, 'g');
}

var smartyRegExp = createSmartyRegExp();

function replaceSmarty(data) {
	return data.replace(smartyRegExp, '');
}


module.exports = function (app) {

	/*app.get(/\/$/, function(req, res) {
		res.redirect('index.html');
	});*/


	app.get(/^(.+\.html)$/, function (req, res) {

		var filename = './client/sites' + req.params['0'];

		function error(err) {

			console.log(err);

			notifier.notify({
				title: 'wenv',
				message: filename + '\n' + err
			});

			res.status(404).send('404');

		}

		fs.readFile(filename, 'utf8', function (err, data) {

			if (err) {
				error(err);
				return;
			}

			data = replaceAliases(data);
			data = replaceSmarty(data);

			res.send(data);

		});

	});


};