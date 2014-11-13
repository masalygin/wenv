var vinyl = require('vinyl-fs');
var map = require('map-stream');


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