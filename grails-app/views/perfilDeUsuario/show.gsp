
<%@ page import="com.pulko.siurana.core.PerfilDeUsuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'perfilDeUsuario.label', default: 'PerfilDeUsuario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-perfilDeUsuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-perfilDeUsuario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list perfilDeUsuario">
			
				<g:if test="${perfilDeUsuarioInstance?.perfil}">
				<li class="fieldcontain">
					<span id="perfil-label" class="property-label"><g:message code="perfilDeUsuario.perfil.label" default="Perfil" /></span>
					
						<span class="property-value" aria-labelledby="perfil-label"><g:link controller="perfil" action="show" id="${perfilDeUsuarioInstance?.perfil?.id}">${perfilDeUsuarioInstance?.perfil?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${perfilDeUsuarioInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="perfilDeUsuario.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${perfilDeUsuarioInstance?.usuario?.id}">${perfilDeUsuarioInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:perfilDeUsuarioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${perfilDeUsuarioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
