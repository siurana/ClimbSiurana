
<%@ page import="com.pulko.siurana.core.PerfilDeUsuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'perfilDeUsuario.label', default: 'PerfilDeUsuario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-perfilDeUsuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-perfilDeUsuario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="perfilDeUsuario.perfil.label" default="Perfil" /></th>
					
						<th><g:message code="perfilDeUsuario.usuario.label" default="Usuario" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${perfilDeUsuarioInstanceList}" status="i" var="perfilDeUsuarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${perfilDeUsuarioInstance.id}">${fieldValue(bean: perfilDeUsuarioInstance, field: "perfil")}</g:link></td>
					
						<td>${fieldValue(bean: perfilDeUsuarioInstance, field: "usuario")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${perfilDeUsuarioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
