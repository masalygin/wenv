{strip}
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<title></title>
	{literal}
		<style type="text/css">
			table {
				width: 100%;
				border-collapse: collapse;
			}

			td {
				vertical-align: top;
				width: 50%;
				border: 1px solid #000;
				padding: 5px;
			}

			.even td {
				background-color: #fafafa;
			}

			pre {
				margin: 0;
			}
		</style>
	{/literal}
</head>
<body>
<table>
	{foreach from=$data item=e key=k}
		<tr class="{if $k % 2 == 0}odd{else}even{/if}">
			<td><strong>{$k}</strong></td>
			<td><pre>{$e|print_r}</pre></td>
		</tr>
	{/foreach}
</table>
</body>
</html>
{/strip}