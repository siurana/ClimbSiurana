<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'asistencia.label', default: 'Asistencia')}" />
		<title>Asistencia</title>
	</head>
	<body>
	
		<div id="create-asistencia" class="content scaffold-create" role="main">
			<h1>Buscar Socio para asistencia</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${asistenciaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${asistenciaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:asistenciaInstance, action:'showUser']" >
				<fieldset class="form">
						<label for="perfil">
							DNI:
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="searchText" required="" value=""/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="buscar" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
