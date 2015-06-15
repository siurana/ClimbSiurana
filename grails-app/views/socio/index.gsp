
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
			<g:form autocomplete="off" url="[resource:socioInstance, action:'index']" method="GET" >
				<fieldset class="filtrarPor">
					<legend>Filtrar por</legend>
					<div class="fieldcontain">
						<label><g:message code="socio.nombre.label" default="Nombre" /></label>
						<g:textField name="nombre" value="${params?.nombre}"/>
						<label><g:message code="socio.apellido.label" default="Apellido" /></label>
						<g:textField name="apellido" value="${params?.apellido}"/><br>
						<label>Solo los activos</label>
						<g:checkBox name="soloLosActivos" value="true"/>
					</div>
					<fieldset>
					<g:submitButton name="create" class="save" value="Filtrar" />
				</fieldset>
				</fieldset>				
			</g:form>
			<table>
			<thead>
					<tr>
					
						<th>Apellido</th>
						<th>Nombre</th>
					<th>DNI</th>				
					<th>Telefono</th>
					<th>Celular</th>
					<th>Email</th>
					<th>Activo</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${socioInstanceList}" status="i" var="socioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
					<td><g:link action="show" id="${socioInstance.id}">${fieldValue(bean: socioInstance, field: "apellido")}</g:link></td>
					
					<td><g:link action="show" id="${socioInstance.id}">${fieldValue(bean: socioInstance, field: "nombre")}</g:link></td>	
					
						<td>${fieldValue(bean: socioInstance, field: "dNI")}</td>
					
						<td>${fieldValue(bean: socioInstance, field: "telefono")}</td>
						
						<td>${fieldValue(bean: socioInstance, field: "celular")}</td>
					
						<td>${fieldValue(bean: socioInstance, field: "email")}</td>
					
						<td><g:checkBox name="activo" disabled="true" value="${socioInstance?.activo}" /></td>
					</tr>
				</g:each>
				</tbody>
			</table>			
		</div>
	</body>
</html>
