
<%@ page import="com.pulko.siurana.fi.SubRubro" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subRubro.label', default: 'SubRubro')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-subRubro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-subRubro" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'subRubro.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'subRubro.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="tipo" title="${message(code: 'subRubro.tipo.label', default: 'Tipo')}" />
					
						<th><g:message code="subRubro.rubro.label" default="Rubro" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${subRubroInstanceList}" status="i" var="subRubroInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${subRubroInstance.id}">${fieldValue(bean: subRubroInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: subRubroInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: subRubroInstance, field: "tipo")}</td>
					
						<td>${fieldValue(bean: subRubroInstance, field: "rubro")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${subRubroInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
