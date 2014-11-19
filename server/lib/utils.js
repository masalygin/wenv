var vinyl = require('vinyl-fs');
var map = require('map-stream');
var notifier = require('node-notifier');

var replace = function(search, replacement) {
	return function(file, cb) {
		file.contents = new Buffer(String(file.contents).replace(search, replacement));
		cb(null, file);
	};
};

module.exports.replace = function(opt) {

	return vinyl.src(opt.glob)
		.pipe(map(replace(opt.search, opt.replacement)))
		.pipe(vinyl.dest(opt.dest));

};

module.exports.regExpEscape = function(text) {
	return text.replace(/[-[\]{}()*+?.,\\^$|#\s]/g, "\\$&");
};


module.exports.error = function(message, res) {

	console.error(message);

	notifier.notify({
		title: 'wenv',
		message: message
	});

	res.status(404).send(message);

};