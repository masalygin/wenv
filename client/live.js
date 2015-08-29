//browserify live.js | uglifyjs -o live.min.js

var io = require('./vendor/socket.io');
var LazyLoad = require('./vendor/lazyload');


function LiveReload(socket) {

	var self = this;
	this.socket = socket;


	this.socket.on('reload', function (type) {
		switch (type) {
			case 'css':
				self.reloadCSS();
				break;
			default:
				self.reloadPage();
				break;
		}
	});

}

LiveReload.prototype.reloadCSS = function() {

	LiveReload.each(document.querySelectorAll('link, style.lazyload'), function() {

		var url = LiveReload.parseURL(this.getAttribute('href'));

		if (/\.scss\.css$/.test(url.pathname)) {
			LazyLoad.css(url.pathname + '?_=' + Date.now(), function(link) {
				link.parentNode.removeChild(link);
			}, this);
		}

	});

};

LiveReload.prototype.reloadPage = function() {
	document.location.reload();
};

LiveReload.each = function(arr, callback) {
	if (!arr) {
		return;
	}
	for (var i = 0, len = arr.length; i < len; i++) {
		callback.call(arr[i], i, arr[i], arr);
	}
};

LiveReload.parseURL = function(url) {
	var a = document.createElement('a');
	a.href = url;
	return a;
};


new LiveReload(io.connect(document.location.hostname + ':3000'));
