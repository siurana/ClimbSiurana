
<%@ page import="com.pulko.siurana.core.Asistencia" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'asistencia.label', default: 'Asistencia')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-asistencia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-asistencia" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list asistencia">
			
				<g:if test="${asistenciaInstance?.fechaHora}">
				<li class="fieldcontain">
					<span id="fechaHora-label" class="property-label"><g:message code="asistencia.fechaHora.label" default="Fecha Hora" /></span>
						<span class="property-value" aria-labelledby="fechaHora-label"><g:formatDate format="dd/MM/yyyy" date="${asistenciaInstance?.fechaHora}" /></span>
				</li>
				</g:if>
			
				<g:if test="${asistenciaInstance?.perfil}">
				<li class="fieldcontain">
					<span id="perfil-label" class="property-label"><g:message code="asistencia.perfil.label" default="Perfil" /></span>
						<span class="property-value" aria-labelledby="perfil-label">${asistenciaInstance?.perfil?.encodeAsHTML()}</span>
				</li>
				</g:if>
			
				<g:if test="${asistenciaInstance?.socio}">
				<li class="fieldcontain">
					<span id="socio-label" class="property-label"><g:message code="asistencia.socio.label" default="Socio" /></span>
						<span class="property-value" aria-labelledby="socio-label">${asistenciaInstance?.socio?.encodeAsHTML()}</span>
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:asistenciaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${asistenciaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
