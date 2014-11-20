


<script src="https://cdn.socket.io/socket.io-1.2.0.js"></script>
{literal}
<script>
	(function() {
		var socket = io.connect('{/literal}http://{$smarty.ip}:80/{literal}');
		socket.on('reload', function (data) {
			document.location.reload();
		});
	})();
</script>
{/literal}