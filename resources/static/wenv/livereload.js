(function() {
	var socket = io.connect(document.location.hostname + ':3001');
	var counter = 0;
	var root = 'images/';

	function escape(path) {
		return path.replace(/([\.\/])/g, '\\$1')
	}

	function getPath(path) {
		return root + path.replace(/\\/g, '/').split(root)[1];
	}

	function scss(path) {

		var path = getPath(path);
		var link = document.querySelector('link[href^=' + escape(path) + ']');

		var newlink = document.createElement('link');
		newlink.setAttribute('rel', 'stylesheet');
		newlink.setAttribute('type', 'text/css');
		newlink.setAttribute('href', path + '.css?' + counter);
		link.parentNode.replaceChild(newlink, link);

	}

	socket.on('reload', function (path) {

		counter++;

		if (/\.scss/.test(path)) {
			scss(path);
		} else {
			document.location.reload();
		}

	});

})();