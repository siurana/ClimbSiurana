<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Grails" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<g:setProvider library="jquery" />
<link rel="shortcut icon"
	href="${resource(dir: 'images', file: 'siurana_plus.jpg')}"
	type="image/x-icon">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'mainStyle.css')}" type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'mobileStyle.css')}" type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'loginControl.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'scheduler.css')}" type="text/css">

<g:layoutHead />
</head>
<body>
	<div id="grailsLogo" role="banner" style="width: 100%; height: 90px;">
		<img src="${resource(dir: 'images', file: 'siurana_plus.jpg')}"
			alt="Siurana"
			style="margin-left: 10px; border: 3px solid #404040; margin-top: 10px; position: absolute; z-index: 1" />
		<div
			style="padding: 29px 150px; width: 600px; color: #B1B1B1; font-size: 35px; position: absolute; z-index: 1">
			Siurana Climbing v
			<g:meta name="app.version" />
		</div>
	</div>
	<div id="header">
		<pulko:loginControl />
	</div>
	<g:layoutBody />
	<div class="footer" role="contentinfo"></div>
	<div id="spinner" class="spinner" style="display: none;">
		<g:message code="spinner.alt" default="Loading&hellip;" />
	</div>
	<g:javascript library="application" />
</body>
</html>
