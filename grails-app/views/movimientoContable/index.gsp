
<%@ page import="com.pulko.siurana.fi.MovimientoContable" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movimientoContable.label', default: 'MovimientoContable')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-movimientoContable" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-movimientoContable" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="fechaHora" title="${message(code: 'movimientoContable.fechaHora.label', default: 'Fecha')}" />
					
						<g:sortableColumn property="monto" title="${message(code: 'movimientoContable.monto.label', default: 'Monto')}" />
					
						<g:sortableColumn property="detalle" title="${message(code: 'movimientoContable.detalle.label', default: 'Detalle')}" />
					
						<th><g:message code="movimientoContable.responsable.label" default="Responsable" /></th>
					
						<th><g:message code="movimientoContable.subRubro.label" default="Sub Rubro" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${movimientoContableInstanceList}" status="i" var="movimientoContableInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${movimientoContableInstance.id}"><g:formatDate format="dd/MM/yyyy" date="${movimientoContableInstance?.fechaHora}" /></g:link></td>
					
						<td>${fieldValue(bean: movimientoContableInstance, field: "monto")}</td>
					
						<td>${fieldValue(bean: movimientoContableInstance, field: "detalle")}</td>
					
						<td>${fieldValue(bean: movimientoContableInstance, field: "responsable")}</td>
					
						<td>${fieldValue(bean: movimientoContableInstance, field: "subRubro")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${movimientoContableInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
