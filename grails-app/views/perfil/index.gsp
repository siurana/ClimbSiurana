
<%@ page import="com.pulko.siurana.core.Perfil" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'perfil.label', default: 'Perfil')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-perfil" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-perfil" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'perfil.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'perfil.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="arancel" title="${message(code: 'perfil.arancel.label', default: 'Arancel')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${perfilInstanceList}" status="i" var="perfilInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${perfilInstance.id}">${fieldValue(bean: perfilInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: perfilInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: perfilInstance, field: "arancel")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${perfilInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
