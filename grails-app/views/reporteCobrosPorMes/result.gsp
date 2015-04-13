
<%@ page import="com.pulko.siurana.core.PerfilDeSocio"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName" value="Reporte cobros por mes" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
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
			<g:message code="default.list.label" args="[entityName]" />
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
				class="property-label"> Total acumulado </span> <span
				class="property-value" aria-labelledby="perfilDeSocio-label">
					$ ${totalAcumulado}
			</span></li>
			<li class="fieldcontain"><span id="perfilDeSocio-label"
				class="property-label"> Total de cobros </span> <span
				class="property-value" aria-labelledby="perfilDeSocio-label">
					${cobroInstanceCount}
			</span></li>
			<li class="fieldcontain">
				<h1>Detalle</h1>
				<table>
					<thead>
						<tr>
							<th><g:message code="cobro.perfilDeSocio.label"
									default="Fecha" /></th>
							<th><g:message code="cobro.perfilDeSocio.label"
									default="Monto" /></th>
							<th><g:message code="cobro.perfilDeSocio.label"
									default="Socio" /></th>
							<th><g:message code="cobro.perfilDeSocio.label"
									default="Perfil" /></th>
							<th><g:message code="cobro.responsable.label"
									default="Responsable" /></th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${cobros}" status="i" var="cobroInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td><g:formatDate format="dd/MM/yyyy"
										date="${cobroInstance?.fechaHora}" /></td>
								<td>
									${fieldValue(bean: cobroInstance, field: "monto")}
								</td>
								<td>
									${cobroInstance?.perfilDeSocio?.socio?.encodeAsHTML()}
								</td>
								<td>
									${cobroInstance?.perfilDeSocio?.perfil?.encodeAsHTML()}
								</td>
								<td>
									${fieldValue(bean: cobroInstance, field: "responsable")}
								</td>

							</tr>
						</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${cobroInstanceCount ?: 0}" />
				</div>
			</li>
		</ol>
	</div>
</body>
</html>
