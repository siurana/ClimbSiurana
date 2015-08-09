
<%@ page import="com.pulko.siurana.fi.CobroPorDia"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'cobroPorDia.label', default: 'CobroPorDia')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#show-cobroPorDia" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="index">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="show-cobroPorDia" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list cobroPorDia">

			<g:if test="${cobroPorDiaInstance?.responsable}">
				<li class="fieldcontain"><span id="responsable-label"
					class="property-label"><g:message
							code="cobroPorDia.responsable.label" default="Responsable" /></span> <span
					class="property-value" aria-labelledby="responsable-label">
						${cobroPorDiaInstance?.responsable?.encodeAsHTML()}
				</span></li>
			</g:if>

			<g:if test="${cobroPorDiaInstance?.fecha}">
				<li class="fieldcontain"><span id="fecha-label"
					class="property-label"><g:message
							code="cobroPorDia.fecha.label" default="Fecha" /></span> <span
					class="property-value" aria-labelledby="fecha-label"><g:formatDate
							format="dd/MM/yyyy" date="${cobroPorDiaInstance?.fecha}" /></span></li>
			</g:if>

			<g:if test="${cobroPorDiaInstance?.monto}">
				<li class="fieldcontain"><span id="monto-label"
					class="property-label"><g:message
							code="cobroPorDia.monto.label" default="Monto" /></span> <span
					class="property-value" aria-labelledby="monto-label"><g:fieldValue
							bean="${cobroPorDiaInstance}" field="monto" /></span></li>
			</g:if>

			<g:if test="${cobroPorDiaInstance?.descripcion}">
				<li class="fieldcontain"><span id="descripcion-label"
					class="property-label"><g:message
							code="cobroPorDia.descripcion.label" default="Descripcion" /></span> <span
					class="property-value" aria-labelledby="descripcion-label"><g:fieldValue
							bean="${cobroPorDiaInstance}" field="descripcion" /></span></li>
			</g:if>



			<g:if test="${cobroPorDiaInstance?.socio}">
				<li class="fieldcontain"><span id="socio-label"
					class="property-label"><g:message
							code="cobroPorDia.socio.label" default="Socio" /></span> <span
					class="property-value" aria-labelledby="socio-label">
						${cobroPorDiaInstance?.socio?.encodeAsHTML()}
				</span></li>
			</g:if>

		</ol>
		<g:form url="[resource:cobroPorDiaInstance, action:'delete']"
			method="DELETE">
			<fieldset class="buttons">
				<g:link class="edit" action="edit" resource="${cobroPorDiaInstance}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
				<g:actionSubmit class="delete" action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
