var fs = require('fs');
var notifier = require('node-notifier');
var config = require('nconf');
var utils = require('../utils');

module.exports = function(app) {

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

			var aliases = config.get('aliases');

			for (var key in aliases) {
				data = data.replace(new RegExp(utils.regExpEscape(key), 'g'), aliases[key]);
			}

			data = data
				.replace(/(\{\$common_js\})/g, '')
				.replace(/(\{(if|foreach)[^\}]+\})/g, '')
				.replace(/(\{\/(if|foreach)\})/g, '')
				.replace(/(\{else[^\}]*\})/g, '');

			res.send(data);

		});

	});


};