
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
			
				<g:if test="${perfilInstance?.asistencias}">
				<li class="fieldcontain">
					<span id="asistencias-label" class="property-label"><g:message code="perfil.asistencias.label" default="Asistencias" /></span>
					
						<g:each in="${perfilInstance.asistencias}" var="a">
						<span class="property-value" aria-labelledby="asistencias-label"><g:link controller="asistencia" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${perfilInstance?.perfilesDeSocios}">
				<li class="fieldcontain">
					<span id="perfilesDeSocios-label" class="property-label"><g:message code="perfil.perfilesDeSocios.label" default="Perfiles De Socios" /></span>
					
						<g:each in="${perfilInstance.perfilesDeSocios}" var="p">
						<span class="property-value" aria-labelledby="perfilesDeSocios-label"><g:link controller="perfilDeSocio" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
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
