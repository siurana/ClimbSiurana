
<%@ page import="com.pulko.siurana.core.PerfilDeSocio"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="tituloPage" value="Movimientos Contables" />
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
				class="property-label"> Total Ingresos </span> <span
				class="property-value" aria-labelledby="perfilDeSocio-label">
					$ ${ingresos}
			</span></li>
			<li class="fieldcontain"><span id="perfilDeSocio-label"
				class="property-label"> Total Egresos</span> <span
				class="property-value" aria-labelledby="perfilDeSocio-label">
					$ ${egresos}
			</span></li>
			<li class="fieldcontain"><span id="perfilDeSocio-label"
				class="property-label"> Resultado</span> <span
				class="property-value" aria-labelledby="perfilDeSocio-label">
					$ ${saldo}
			</span></li>
			<li class="fieldcontain">
				<h1>Detalle de los movimientos contables</h1>
				<table>
					<thead>
						<tr>						
							<th>Fecha</th>
							<th>Rubro</th>
							<th>Sub-Rubro</th>
							<th>Detalle</th>
							<th>Egreso</th>
							<th>Ingreso</th>
							<th>Saldo</th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${movimientos}" status="i" var="movInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td><g:formatDate format="dd/MM/yyyy"
										date="${movInstance?.fecha}" /></td>
								<td>
									${movInstance?.rubro?.encodeAsHTML()}
								</td>
								<td>
									${movInstance?.subRubro?.encodeAsHTML()}
								</td>
								<td>
									${movInstance?.detalle?.encodeAsHTML()}
								</td>
								<td>
									$ ${movInstance?.egreso?.encodeAsHTML()}
								</td>
								<td>
									$ ${movInstance?.ingreso?.encodeAsHTML()}
								</td>
								<td>
									$ ${movInstance?.saldo?.encodeAsHTML()}
								</td>

							</tr>
						</g:each>
					</tbody>
					<tfoot>
						<tr>
						<td colspan="4">
									RESUMEN <g:formatDate format="MMMM yyyy" date="${fecha}" />
								</td>
								<td>
									$ -${egresos}
								</td>
								<td>
									$ ${ingresos}
								</td>
								<td>
									$ ${saldo}
								</td>
								</tr>
					</tfoot>
				</table>				
			</li>
		</ol>
	</div>
</body>
</html>
