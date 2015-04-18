<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'perfilDeSocio.label', default: 'Asociar Modalidad')}" />
		<title>${entityName}</title>
	</head>
	<body>
		<a href="#create-perfilDeSocio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="home" action="show" id="${perfilDeSocioInstance?.socio?.id}">Regresar</g:link></li>
			</ul>
		</div>
		<div id="create-perfilDeSocio" class="content scaffold-create" role="main">
			<h1>${entityName}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${perfilDeSocioInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${perfilDeSocioInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[controller: 'socio', action:'savePerfilDeSocio']" >
				<fieldset class="form">

<div class="fieldcontain ${hasErrors(bean: perfilDeSocioInstance, field: 'socio', 'error')} required">
	<label for="socio">
		<g:message code="perfilDeSocio.socio.label" default="Socio" />
	</label>
	${perfilDeSocioInstance?.socio}
	<g:hiddenField id="socio" name="socio.id" value="${perfilDeSocioInstance?.socio?.id}"/>

</div>					
<div class="fieldcontain ${hasErrors(bean: perfilDeSocioInstance, field: 'perfil', 'error')} required">
	<label for="perfil">
		<g:message code="perfilDeSocio.perfil.label" default="Perfil" />
	</label>	
	<g:select id="perfil" name="perfil.id" from="${com.pulko.siurana.core.Perfil.list()}" optionKey="id" required="" value="${perfilDeSocioInstance?.perfil?.id}" class="many-to-one"/>

</div>


				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="Asociar" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
