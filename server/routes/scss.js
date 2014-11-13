var notifier = require('node-notifier');
var sass = require('node-sass');
var path = require('path');
var utils = require('../utils');

module.exports = function (app) {

	app.get(/^(.+\.scss\.css)$/, function (req, res) {

		var cssFile = './client/sites' + req.params['0'];
		var scssFile = cssFile.replace(/\.scss\.css$/, '.scss');
		var parts = scssFile.split('/images/');
		var imageFolder = parts[0] + '/images/';
		var cacheFolder = '.cache/site/';


		function error(err) {
			console.log(err);
			notifier.notify({
				title: 'wenv',
				message: scssFile + '\n' + err
			});
			res.status(404).send('404');
		}

		utils.replace({

			glob: imageFolder + '**/*.scss',
			dest: cacheFolder,
			search: /global:\//g,
			replacement: ''

		}).on('end', function() {

			sass.renderFile({
				file: cacheFolder + parts[1],
				outFile: cssFile,
				includePaths: ['./.cache/site/', './.cache/g/', './client/public/'],
				success: function () {
					res.sendfile(cssFile);
				},
				error: error
			});

		});



	});

};