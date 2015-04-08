
<%@ page import="com.pulko.siurana.core.Socio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'socio.label', default: 'Socio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-socio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-socio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list socio">
			
				<g:if test="${socioInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="socio.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${socioInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.apellido}">
				<li class="fieldcontain">
					<span id="apellido-label" class="property-label"><g:message code="socio.apellido.label" default="Apellido" /></span>
					
						<span class="property-value" aria-labelledby="apellido-label"><g:fieldValue bean="${socioInstance}" field="apellido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.nroDocumento}">
				<li class="fieldcontain">
					<span id="nroDocumento-label" class="property-label"><g:message code="socio.nroDocumento.label" default="Nro Documento" /></span>
					
						<span class="property-value" aria-labelledby="nroDocumento-label"><g:fieldValue bean="${socioInstance}" field="nroDocumento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.fechaDeNacimiento}">
				<li class="fieldcontain">
					<span id="fechaDeNacimiento-label" class="property-label"><g:message code="socio.fechaDeNacimiento.label" default="Fecha De Nacimiento" /></span>
					
						<span class="property-value" aria-labelledby="fechaDeNacimiento-label"><g:formatDate date="${socioInstance?.fechaDeNacimiento}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.telefono}">
				<li class="fieldcontain">
					<span id="telefono-label" class="property-label"><g:message code="socio.telefono.label" default="Telefono" /></span>
					
						<span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${socioInstance}" field="telefono"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="socio.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${socioInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.sexo}">
				<li class="fieldcontain">
					<span id="sexo-label" class="property-label"><g:message code="socio.sexo.label" default="Sexo" /></span>
					
						<span class="property-value" aria-labelledby="sexo-label"><g:fieldValue bean="${socioInstance}" field="sexo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.activo}">
				<li class="fieldcontain">
					<span id="activo-label" class="property-label"><g:message code="socio.activo.label" default="Activo" /></span>
					
						<span class="property-value" aria-labelledby="activo-label"><g:formatBoolean boolean="${socioInstance?.activo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.comentarios}">
				<li class="fieldcontain">
					<span id="comentarios-label" class="property-label"><g:message code="socio.comentarios.label" default="Comentarios" /></span>
					
						<span class="property-value" aria-labelledby="comentarios-label"><g:fieldValue bean="${socioInstance}" field="comentarios"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.asistencias}">
				<li class="fieldcontain">
					<span id="asistencias-label" class="property-label"><g:message code="socio.asistencias.label" default="Asistencias" /></span>
					
						<g:each in="${socioInstance.asistencias}" var="a">
						<span class="property-value" aria-labelledby="asistencias-label"><g:link controller="asistencia" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.perfilesDeSocio}">
				<li class="fieldcontain">
					<span id="perfilesDeSocio-label" class="property-label"><g:message code="socio.perfilesDeSocio.label" default="Perfiles De Socio" /></span>
					
						<g:each in="${socioInstance.perfilesDeSocio}" var="p">
						<span class="property-value" aria-labelledby="perfilesDeSocio-label"><g:link controller="perfilDeSocio" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:socioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${socioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
