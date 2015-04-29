
<%@ page import="com.pulko.siurana.core.Socio"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'socio.label', default: 'Socio')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#show-socio" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div id="show-socio" class="content scaffold-show" role="main">
		<div class="nav" role="navigation"></div>
		<h1>
			<g:fieldValue bean="${socioInstance}" field="apellido" />
			,
			<g:fieldValue bean="${socioInstance}" field="nombre" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		
		<fieldset class="asistencia">
				<legend><span id="asistencias-label" class="property-label">Asistencias del dia: <g:formatDate format="dd / MM / yyyy" date="${new Date()}" /></span></legend>
		<ol class="property-list socio">	
			<g:each in="${asistenciasDeHoy}" var="a">
				<li class="fieldcontain"> 
					<pulko:registrarAsistencia perfil="${a?.perfil?.encodeAsHTML()}" idSocio="${a?.idSocio}" isRegistrada="${a?.registrada}" idPerfil="${a?.perfil?.id}"/>
					</li>
			</g:each>
		</ol>
		</fieldset>
	</div>
</body>
</html>
