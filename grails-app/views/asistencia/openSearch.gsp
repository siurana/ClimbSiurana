<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'asistencia.label', default: 'Asistencia')}" />
		<title>Asistencia</title>
	</head>
	<body>
	
		<div id="create-asistencia" class="content scaffold-create" role="main">
		<div class="nav" role="navigation"></div>
			<h1>Buscar Socio para asistencia</h1>
			<g:if test="${flash.message}">
			<div class="message hideMe" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${asistenciaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${asistenciaInstance}" var="error">
				<li> <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<g:if test="${flash.asistenciaInstance?.fechaHora}">
			<ol class="property-list asistencia hideMe">
			
				<g:if test="${flash.asistenciaInstance?.fechaHora}">
				<li class="fieldcontain">
					<span id="fechaHora-label" class="property-label"><g:message code="asistencia.fechaHora.label" default="Fecha Hora" /></span>
						<span class="property-value" aria-labelledby="fechaHora-label"><g:formatDate format="dd/MM/yyyy - HH:mm" date="${flash.asistenciaInstance?.fechaHora}" />hs</span>
				</li>
				</g:if>
			
				<g:if test="${flash.asistenciaInstance?.perfil}">
				<li class="fieldcontain">
					<span id="perfil-label" class="property-label"><g:message code="asistencia.perfil.label" default="Perfil" /></span>
						<span class="property-value" aria-labelledby="perfil-label">${flash.asistenciaInstance?.perfil?.encodeAsHTML()}</span>
				</li>
				</g:if>
			
				<g:if test="${flash.asistenciaInstance?.socio}">
				<li class="fieldcontain">
					<span id="socio-label" class="property-label"><g:message code="asistencia.socio.label" default="Socio" /></span>
						<span class="property-value" aria-labelledby="socio-label">${flash.asistenciaInstance?.socio?.encodeAsHTML()}</span>
				</li>
				</g:if>
				
				<g:if test="${flash.asistenciaInstance?.socio}">
				<li class="fieldcontain">
					<span id="socio-label" class="property-label">Asistencias en el mes</span>
						<span class="property-value" aria-labelledby="socio-label">${flash.asistenciasDelMes}</span>
				</li>
				</g:if>
				<g:if test="${flash.asistenciaInstance?.socio}">
				<li class="fieldcontain">
					<span id="socio-label" class="property-label">Ultimo pago</span>
						<span class="property-value" aria-labelledby="socio-label">${flash.lastCobroMessage}</span>
				</li>
				</g:if>
			<br>
			</ol>
			</g:if>
			
			<g:form autocomplete="off" url="[resource:asistenciaInstance, action:'showSocio']" method="POST" >
				<fieldset class="form">
						<label for="perfil">
							DNI:							
						</label>
						<g:textField name="searchText" value=""/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="buscar" />
				</fieldset>
			</g:form>
		</div>
		<script type="text/javascript">
        $(function() {            
        	setTimeout(function() {
        		$(".hideMe").hide("slow");
            }, 30000);

            $(".hideMe").click(function() {
            	$(".hideMe").hide("slow");
            });
        });
    </script>
	</body>
</html>
