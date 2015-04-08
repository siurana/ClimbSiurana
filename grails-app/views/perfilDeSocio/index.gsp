
<%@ page import="com.pulko.siurana.core.PerfilDeSocio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'perfilDeSocio.label', default: 'PerfilDeSocio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-perfilDeSocio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-perfilDeSocio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="perfilDeSocio.perfil.label" default="Perfil" /></th>
					
						<th><g:message code="perfilDeSocio.socio.label" default="Socio" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${perfilDeSocioInstanceList}" status="i" var="perfilDeSocioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${perfilDeSocioInstance.id}">${fieldValue(bean: perfilDeSocioInstance, field: "perfil")}</g:link></td>
					
						<td>${fieldValue(bean: perfilDeSocioInstance, field: "socio")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${perfilDeSocioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
