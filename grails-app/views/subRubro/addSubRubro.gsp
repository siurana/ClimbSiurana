<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'subRubro.label', default: 'SubRubro')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	<a href="#create-subRubro" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="index">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="create-subRubro" class="content scaffold-create" role="main">
		<h1>
			<g:message code="default.create.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${subRubroInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${subRubroInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form url="[resource:subRubroInstance, action:'saveSubRubro']">
			<fieldset class="form">
			
			<div class="fieldcontain ">
					<label for="nombre"> <g:message
							code="subRubro.rubro.label" default="Rubro" />
					</label>
					${subRubroInstance?.rubro?.encodeAsHTML()}
					<g:hiddenField id="rubro" name="rubro.id" value="${subRubroInstance?.rubro?.id}"/>
				</div>
				<div
					class="fieldcontain ${hasErrors(bean: subRubroInstance, field: 'nombre', 'error')} required">
					<label for="nombre"> <g:message
							code="subRubro.nombre.label" default="Nombre" /> <span
						class="required-indicator">*</span>
					</label>
					<g:textField name="nombre" required=""
						value="${subRubroInstance?.nombre}" />

				</div>

				<div
					class="fieldcontain ${hasErrors(bean: subRubroInstance, field: 'descripcion', 'error')} required">
					<label for="descripcion"> <g:message
							code="subRubro.descripcion.label" default="Descripcion" /> <span
						class="required-indicator">*</span>
					</label>
					<g:textField name="descripcion" required=""
						value="${subRubroInstance?.descripcion}" />

				</div>

				<div
					class="fieldcontain ${hasErrors(bean: subRubroInstance, field: 'tipo', 'error')} required">
					<label for="tipo"> <g:message code="subRubro.tipo.label"
							default="Tipo" /> <span class="required-indicator">*</span>
					</label>
					<g:select name="tipo"
						from="${subRubroInstance.constraints.tipo.inList}" required=""
						value="${subRubroInstance?.tipo}"
						valueMessagePrefix="subRubro.tipo" />

				</div>

			</fieldset>
			<fieldset class="buttons">
				<g:submitButton name="create" class="save"
					value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
