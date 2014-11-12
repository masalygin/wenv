var express = require('express');
var path = require('path');
var favicon = require('static-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var sass = require('node-sass');
var fs = require('fs');
var notifier = require('node-notifier');
var config = require('./config.json');

var app = express();

app.use(favicon());
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded());
app.use(cookieParser());


RegExp.escape = function(text) {
	return text.replace(/[-[\]{}()*+?.,\\^$|#\s]/g, "\\$&");
};


app.get(/^(.+\.scss\.css)$/, function (req, res) {

	var cssFile = './sites' + req.params['0'];
	var scssFile = cssFile.replace(/\.scss\.css$/, '.scss')

	function error(err) {

		console.log(err);

		notifier.notify({
			title: 'wenv',
			message: scssFile + '\n' + err
		});

		res.status(404).end();

	}

	fs.readFile(scssFile, 'utf8', function (err, data) {

		if (err) {
			error(err);
			return;
		}

		data = data.replace(/global:\//g, '');

		sass.render({
			data: data,
			includePaths: ['./g/'],
			success: function (css) {

				fs.writeFile(cssFile, css, function (err) {

					if (err) {
						error(err);
						return;
					}

					res.sendfile(cssFile);

				});

			},
			error: error
		});

	});

});


app.get(/^(.+\.html)$/, function (req, res) {

	var filename = './sites' + req.params['0'];

	function error(err) {

		console.log(err);

		notifier.notify({
			title: 'wenv',
			message: filename + '\n' + err
		});

		res.status(404).end();

	}

	fs.readFile(filename, 'utf8', function (err, data) {

		if (err) {
			error(err);
			return;
		}

		for (var val in config.aliases) {
			data = data.replace(new RegExp(RegExp.escape(val), 'g'), config.aliases[val]);
		}

		data = data
			.replace(/(\{\$common_js\})/g, '<!-- $1 -->')
			.replace(/(\{(if|foreach)[^\}]+\})/g, '<!-- $1 -->')
			.replace(/(\{\/(if|foreach)\})/g, '<!-- $1 -->')
			.replace(/(\{else[^\}]*\})/g, '<!-- $1 -->');

		res.send(data);

	});

});

app.get(/^\/(\d+\/)$/, function(req, res) {
	res.redirect('index.html');
});

app.use(express.static(path.join(__dirname, 'sites')));

app.get('/', function (req, res) {
	res.json({title: 'Express'});
});


app.use(function (req, res, next) {
	var err = new Error('Not Found');
	err.status = 404;
	next(err);
});


app.set('port', process.env.PORT || 3000);


var server = app.listen(app.get('port'), function () {
	console.log('Express server listening on port ' + server.address().port);
});