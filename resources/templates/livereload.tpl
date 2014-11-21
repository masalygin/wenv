


<script src="/g/libs/socket.io/1.2.0/socket.io.js"></script>
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