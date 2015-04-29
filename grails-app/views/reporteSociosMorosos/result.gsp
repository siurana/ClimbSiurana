
<%@ page import="com.pulko.siurana.core.PerfilDeSocio"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="tituloPage" value="Reporte cobros por mes" />
<title>${tituloPage}</title>
</head>
<body>
	<a href="#list-perfilDeSocio" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><g:link class="home" action="index">Regresar</g:link></li>
		</ul>
	</div>
	<div id="list-cobro" class="content scaffold-list" role="main">
		<h1>
			${tituloPage}
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list cobro">
			<li class="fieldcontain"><span id="perfilDeSocio-label"
				class="property-label"> Periodo seleccionado </span> <span
				class="property-value" aria-labelledby="perfilDeSocio-label">
					<g:formatDate format="MMMM yyyy" date="${fecha}" />
			</span></li>
			<li class="fieldcontain"><span id="perfilDeSocio-label"
				class="property-label"> Total Adeudado </span> <span
				class="property-value" aria-labelledby="perfilDeSocio-label">
					$ ${totalMorosos}
			</span></li>
			<li class="fieldcontain"><span id="perfilDeSocio-label"
				class="property-label"> Total de morosos </span> <span
				class="property-value" aria-labelledby="perfilDeSocio-label">
					${morososInstanceCount}
			</span></li>
			<li class="fieldcontain">
				<h1>Detalle</h1>
				<table>
			<thead>
					<tr>					
						<th>Nombre</th>
						<th>Apellido</th>					
						<th>DNI</th>					
						<th>Telefono</th>						
						<th>Celular</th>					
						<th>Email</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${lista}" status="i" var="socioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>${fieldValue(bean: socioInstance, field: "nombre")}</td>
						<td>${fieldValue(bean: socioInstance, field: "apellido")}</td>
						<td>${fieldValue(bean: socioInstance, field: "dNI")}</td>
						<td>${fieldValue(bean: socioInstance, field: "telefono")}</td>
						<td>${fieldValue(bean: socioInstance, field: "celular")}</td>
						<td>${fieldValue(bean: socioInstance, field: "email")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>			
			</li>
		</ol>
	</div>
</body>
</html>
