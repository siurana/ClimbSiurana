
<%@ page import="com.pulko.siurana.fi.Rubro" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'rubro.label', default: 'Rubro')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-rubro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-rubro" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list rubro">
			
				<g:if test="${rubroInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="rubro.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${rubroInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${rubroInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="rubro.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${rubroInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${rubroInstance.subRubros}">
				<li class="fieldcontain">
					<span id="subRubros-label" class="property-label"><g:message code="rubro.subRubros.label" default="Sub Rubros" /></span>
					
						<g:each in="${rubroInstance.subRubros}" var="s">
						<span class="property-value" aria-labelledby="subRubros-label"><g:link controller="subRubro" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:rubroInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${rubroInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					<g:link controller="subRubro" action="addSubRubro" params="['rubro.id': rubroInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'subRubro.label', default: 'SubRubro')])}</g:link>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
