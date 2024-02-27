<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Document</title>
		<script src="/assets/js/htmx.min.js"></script>
		<style>
			.htmx-indicator {
				display: none;
			}
			.htmx-request .htmx-indicator {
				display: inline;
			}
			.htmx-request.htmx-indicator {
				display: inline;
			}
		</style>
	</head>
	<body>
		<h1><?= ($title) ?></h1>
		<button hx-get="/api/now" hx-target="#time-slot" hx-swap="outerHTML ignoreTitle:true">
			Click for the time!
		</button>

		<div id="time-slot"></div>
	</body>
</html>
