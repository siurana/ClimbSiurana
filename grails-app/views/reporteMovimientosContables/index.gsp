
<%@ page import="com.pulko.siurana.core.PerfilDeSocio"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">

<title>Movimientos Contables</title>
</head>
<body>
	<a href="#list-perfilDeSocio" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
		</ul>
	</div>
	<div id="list-perfilDeSocio" class="content scaffold-list" role="main">
		<h1>
			Movimientos Contables
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:form autocomplete="off" url="[action:'result']">
			<fieldset class="form">
				<div
					class="fieldcontain ${hasErrors(bean: perfilDeSocioInstance, field: 'perfil', 'error')} required">
					<label for="perfil"> Seleccione un periodo
					</label>
					<g:datePicker name="fecha" format="MM/yyyy" precision="month"  value="${new Date()}" default="none" noSelection="['': '']" />
				</div>
			</fieldset>
			<fieldset class="buttons">
				<g:submitButton value="Generar" name="generar" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
