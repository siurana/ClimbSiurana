
<%@ page import="com.pulko.siurana.fi.MovimientoContable" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movimientoContable.label', default: 'MovimientoContable')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-movimientoContable" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-movimientoContable" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list movimientoContable">
			
			<g:if test="${movimientoContableInstance?.subRubro}">
				<li class="fieldcontain">
					<span id="subRubro-label" class="property-label"><g:message code="movimientoContable.subRubro.label" default="Rubro" /></span>
					
						<span class="property-value" aria-labelledby="subRubro-label">${movimientoContableInstance?.subRubro?.rubro?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
				<g:if test="${movimientoContableInstance?.subRubro}">
				<li class="fieldcontain">
					<span id="subRubro-label" class="property-label"><g:message code="movimientoContable.subRubro.label" default="Sub Rubro" /></span>
					
						<span class="property-value" aria-labelledby="subRubro-label">${movimientoContableInstance?.subRubro?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
				<g:if test="${movimientoContableInstance?.fechaHora}">
				<li class="fieldcontain">
					<span id="fechaHora-label" class="property-label"><g:message code="movimientoContable.fechaHora.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fechaHora-label"><g:formatDate format="dd/MM/yyyy" date="${movimientoContableInstance?.fechaHora}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoContableInstance?.monto}">
				<li class="fieldcontain">
					<span id="monto-label" class="property-label"><g:message code="movimientoContable.monto.label" default="Monto" /></span>
					
						<span class="property-value" aria-labelledby="monto-label"><g:fieldValue bean="${movimientoContableInstance}" field="monto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoContableInstance?.detalle}">
				<li class="fieldcontain">
					<span id="detalle-label" class="property-label"><g:message code="movimientoContable.detalle.label" default="Detalle" /></span>
					
						<span class="property-value" aria-labelledby="detalle-label"><g:fieldValue bean="${movimientoContableInstance}" field="detalle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${movimientoContableInstance?.responsable}">
				<li class="fieldcontain">
					<span id="responsable-label" class="property-label"><g:message code="movimientoContable.responsable.label" default="Responsable" /></span>
					
						<span class="property-value" aria-labelledby="responsable-label">${movimientoContableInstance?.responsable?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
		
			
			</ol>
			<g:form url="[resource:movimientoContableInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${movimientoContableInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
