var io = require('./socket.io');
var LazyLoad = require('./lazyload');
var socket = io.connect(document.location.hostname + ':3001');
var counter = 0;

function escape(path) {
	return path.replace(/([\.\/])/g, '\\$1');
}

function relative(path) {
	var root = 'images/';
	return root + path.replace(/\\/g, '/').split(root)[1];
}

function reloadCSS(path) {

	path = relative(path);
	var link = document.querySelector('link[href^=' + escape(path) + ']');
	path = path + '.css?_=' + counter;

	LazyLoad.css(path, function() {
		link && link.parentNode.removeChild(link);
	});

}


socket.on('reload', function (path) {
	counter++;

	if (/\.scss/.test(path)) {
		reloadCSS(path);
	} else {
		document.location.reload();
	}

});