
<%@ page import="com.pulko.siurana.core.PerfilDeSocio"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="tituloPage" value="Reporte de Asistencias" />
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
				 	<g:formatDate format="dd/MM/yyyy" date="${fechaDesde}" /> - 
				 	<g:formatDate format="dd/MM/yyyy" date="${fechaHasta}" />
				 	 
			</span></li>
			<li class="fieldcontain"><span id="perfilDeSocio-label"
				class="property-label"> Total de Asistencias </span> <span
				class="property-value" aria-labelledby="perfilDeSocio-label">
				 	${totalAsistencias}
				 	 
			</span></li>
			<li class="fieldcontain">
				<h1>Detalle de asistencias</h1>
				<table>
			<thead>
					<tr>
						<th><g:message code="asistencia.fechaHora.label" default= "Fecha Hora"/></th>					
						<th><g:message code="asistencia.socio.label" default="Socio" /></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${lista}" status="i" var="item">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:formatDate format="dd/MM/yyyy" date="${item[0]}" /></td>					
						<td>${item[1]}</td>					
					</tr>
				</g:each>
				</tbody>
			</table>			
			</li>
		</ol>
	</div>
</body>
</html>
