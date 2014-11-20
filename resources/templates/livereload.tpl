<script src="https://cdn.socket.io/socket.io-1.2.0.js"></script>
<script>
	(function() {
		var socket = io.connect('http://192.168.0.187:80/');
		socket.on('reload', function (data) {
			document.location.reload();
		});
	})();
</script>