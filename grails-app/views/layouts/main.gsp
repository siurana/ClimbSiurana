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
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'mainStyle.css')}" type="text/css">

<r:layoutResources />
<g:layoutHead />
</head>
<body>
	<header>
		<pulko:loginControl />
		<nav>
			<ul>
				<li><a href="#">Inicio</a></li>
				<li><span name="categoria">Categorias</span></li>
				<li><a href="#">Servicios</a></li>
				<li><span name="reportes">Reportes</span></li>
				<li><a href="#">Contacto</a></li>
			</ul>
			<div id="categoria">
				<ul>
					<li><a href="#">Usuarios</a></li>
					<li><a href="#">Perfiles</a></li>
					<li><a href="#">Asistencias</a></li>
				</ul>
				<ul>
					<li><a href="#">Item #1</a></li>
					<li><a href="#">Item #2</a></li>
					<li><a href="#">Item #3</a></li>
					<li><a href="#">Item #4</a></li>
					<li><a href="#">Item #5</a></li>
				</ul>
			</div>
			<div id="reportes">
				<ul>
					<li><a href="#">Reporte #1</a></li>
					<li><a href="#">Reporte #2</a></li>
					<li><a href="#">Reporte #3</a></li>
					<li><a href="#">Reporte #4</a></li>
				</ul>
			</div>
		</nav>
	</header>

	<div id="wrapper">
		<g:layoutBody />

		<div id="spinner" class="spinner" style="display: none;">
			<g:message code="spinner.alt" default="Loading&hellip;" />
		</div>
		<g:javascript library="application" />
		<fieldset class="footerFill"></fieldset>
	</div>

	<g:javascript library="jquery" plugin="jquery" />
	<script>
		$(function() {
			if (!$('.buttons').length) {
				$('.footerFill').show();
			}

			$('nav > ul > li > span').click(function(e) {
				var seleccionar = $(this).hasClass('selectedMenu');
				if ($('nav > ul > li > span').hasClass('selectedMenu')) {
					$('nav > ul > li > span').removeClass('selectedMenu');
					$('nav > div').hide();
				} 
				if (!seleccionar) {
					$(this).addClass('selectedMenu');
					var idSubMenu = '#' + $(this).attr("name");
					$(idSubMenu).slideToggle();
				}
			});
		});
	</script>
</body>
</html>
