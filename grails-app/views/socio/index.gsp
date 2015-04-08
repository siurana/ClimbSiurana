
<%@ page import="com.pulko.siurana.core.Socio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'socio.label', default: 'Socio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-socio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-socio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'socio.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="apellido" title="${message(code: 'socio.apellido.label', default: 'Apellido')}" />
					
						<g:sortableColumn property="nroDocumento" title="${message(code: 'socio.nroDocumento.label', default: 'Nro Documento')}" />
					
						<g:sortableColumn property="fechaDeNacimiento" title="${message(code: 'socio.fechaDeNacimiento.label', default: 'Fecha De Nacimiento')}" />
					
						<g:sortableColumn property="telefono" title="${message(code: 'socio.telefono.label', default: 'Telefono')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'socio.email.label', default: 'Email')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${socioInstanceList}" status="i" var="socioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${socioInstance.id}">${fieldValue(bean: socioInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: socioInstance, field: "apellido")}</td>
					
						<td>${fieldValue(bean: socioInstance, field: "nroDocumento")}</td>
					
						<td><g:formatDate date="${socioInstance.fechaDeNacimiento}" /></td>
					
						<td>${fieldValue(bean: socioInstance, field: "telefono")}</td>
					
						<td>${fieldValue(bean: socioInstance, field: "email")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${socioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
