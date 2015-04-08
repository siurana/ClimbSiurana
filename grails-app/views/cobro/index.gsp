
<%@ page import="com.pulko.siurana.fi.Cobro" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cobro.label', default: 'Cobro')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cobro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cobro" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="fechaHora" title="${message(code: 'cobro.fechaHora.label', default: 'Fecha')}" />
					
						<g:sortableColumn property="monto" title="${message(code: 'cobro.monto.label', default: 'Monto')}" />
					
						<th><g:message code="cobro.perfilDeSocio.label" default="Socio" /></th>
					
						<th><g:message code="cobro.perfilDeSocio.label" default="Perfil" /></th>
					
						<th><g:message code="cobro.responsable.label" default="Responsable" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cobroInstanceList}" status="i" var="cobroInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cobroInstance.id}"><g:formatDate format="dd/MM/yyyy" date="${cobroInstance?.fechaHora}" /></g:link></td>
					
						<td>${fieldValue(bean: cobroInstance, field: "monto")}</td>
					
						<td>${cobroInstance?.perfilDeSocio?.socio?.encodeAsHTML()}</td>
					
						<td>${cobroInstance?.perfilDeSocio?.perfil?.encodeAsHTML()}</td>
					
						<td>${fieldValue(bean: cobroInstance, field: "responsable")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cobroInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
