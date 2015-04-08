
<%@ page import="com.pulko.siurana.core.Asistencia" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'asistencia.label', default: 'Asistencia')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-asistencia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-asistencia" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="fechaHora" title="${message(code: 'asistencia.fechaHora.label', default: 'Fecha Hora')}" />
					
						<th><g:message code="asistencia.perfil.label" default="Perfil" /></th>
					
						<th><g:message code="asistencia.socio.label" default="Socio" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${asistenciaInstanceList}" status="i" var="asistenciaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${asistenciaInstance.id}">${fieldValue(bean: asistenciaInstance, field: "fechaHora")}</g:link></td>
					
						<td>${fieldValue(bean: asistenciaInstance, field: "perfil")}</td>
					
						<td>${fieldValue(bean: asistenciaInstance, field: "socio")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${asistenciaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
