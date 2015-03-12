
<%@ page import="com.pulko.siurana.core.Perfil" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'perfil.label', default: 'Perfil')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-perfil" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-perfil" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list perfil">
			
				<g:if test="${perfilInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="perfil.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${perfilInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${perfilInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="perfil.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${perfilInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${perfilInstance?.arancel}">
				<li class="fieldcontain">
					<span id="arancel-label" class="property-label"><g:message code="perfil.arancel.label" default="Arancel" /></span>
					
						<span class="property-value" aria-labelledby="arancel-label"><g:fieldValue bean="${perfilInstance}" field="arancel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${perfilInstance?.esLibre}">
				<li class="fieldcontain">
					<span id="esLibre-label" class="property-label"><g:message code="perfil.esLibre.label" default="Es Libre" /></span>
					
						<span class="property-value" aria-labelledby="esLibre-label"><g:formatBoolean boolean="${perfilInstance?.esLibre}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${perfilInstance?.nroDeClases}">
				<li class="fieldcontain">
					<span id="nroDeClases-label" class="property-label"><g:message code="perfil.nroDeClases.label" default="Nro De Clases" /></span>
					
						<span class="property-value" aria-labelledby="nroDeClases-label"><g:fieldValue bean="${perfilInstance}" field="nroDeClases"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${perfilInstance?.asistencia}">
				<li class="fieldcontain">
					<span id="asistencia-label" class="property-label"><g:message code="perfil.asistencia.label" default="Asistencia" /></span>
					
						<g:each in="${perfilInstance.asistencia}" var="a">
						<span class="property-value" aria-labelledby="asistencia-label"><g:link controller="asistencia" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${perfilInstance?.perfilesDeUsuario}">
				<li class="fieldcontain">
					<span id="perfilesDeUsuario-label" class="property-label"><g:message code="perfil.perfilesDeUsuario.label" default="Perfiles De Usuario" /></span>
					
						<g:each in="${perfilInstance.perfilesDeUsuario}" var="p">
						<span class="property-value" aria-labelledby="perfilesDeUsuario-label"><g:link controller="perfilDeUsuario" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:perfilInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${perfilInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
