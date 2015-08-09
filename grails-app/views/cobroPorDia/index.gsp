
<%@ page import="com.pulko.siurana.fi.CobroPorDia" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cobroPorDia.label', default: 'CobroPorDia')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cobroPorDia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cobroPorDia" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="fecha" title="${message(code: 'cobroPorDia.fecha.label', default: 'Fecha')}" />
					
						<g:sortableColumn property="monto" title="${message(code: 'cobroPorDia.monto.label', default: 'Monto')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'cobroPorDia.descripcion.label', default: 'Descripcion')}" />
					
						<th><g:message code="cobroPorDia.responsable.label" default="Responsable" /></th>
					
						<th><g:message code="cobroPorDia.socio.label" default="Socio" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cobroPorDiaInstanceList}" status="i" var="cobroPorDiaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cobroPorDiaInstance.id}"><g:formatDate format="dd/MM/yyyy" date="${cobroPorDiaInstance?.fecha}" /></g:link></td>
					
						<td>${fieldValue(bean: cobroPorDiaInstance, field: "monto")}</td>
					
						<td>${fieldValue(bean: cobroPorDiaInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: cobroPorDiaInstance, field: "responsable")}</td>
					
						<td>${fieldValue(bean: cobroPorDiaInstance, field: "socio")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cobroPorDiaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
