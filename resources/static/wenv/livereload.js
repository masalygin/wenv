var io = require('./socket.io');
var socket = io.connect(document.location.hostname + ':3001');
var counter = 0;
var focus = true;
var pageXOffset, pageYOffset;

function escape(path) {
	return path.replace(/([\.\/])/g, '\\$1');
}

function relative(path) {
	var root = 'images/';
	return root + path.replace(/\\/g, '/').split(root)[1];
}

window.addEventListener('focus', function() {
	focus = true;
});

window.addEventListener('blur', function() {
	focus = false;
	pageXOffset = window.pageXOffset;
	pageYOffset = window.pageYOffset;
});

setInterval(function() {

	if (!focus) {
		window.scrollTo(pageXOffset, pageYOffset);
	}

}, 10);

function reloadCSS(path) {

	path = relative(path);
	var link = document.querySelector('link[href^=' + escape(path) + ']');
	path = path + '.css?_=' + counter;

	var newlink = document.createElement('link');
	newlink.setAttribute('rel', 'stylesheet');
	newlink.setAttribute('type', 'text/css');
	newlink.setAttribute('href', path);
	link.parentNode.replaceChild(newlink, link);

}


socket.on('reload', function (path) {
	counter++;

	if (/\.scss/.test(path)) {
		reloadCSS(path);
	} else {
		document.location.reload();
	}

});