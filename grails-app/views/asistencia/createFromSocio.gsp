<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'asistencia.label', default: 'Asistencia')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	<a href="#create-asistencia" class="skip" tabindex="-1"><g:message
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
	<div id="create-asistencia" class="content scaffold-create" role="main">
		<h1>
			<g:message code="default.create.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${asistenciaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${asistenciaInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form autocomplete="off"
			url="[resource:asistenciaInstance, action:'saveFromSocio']">
			<fieldset class="form">
				<ol class="property-list cobro">
					<li class="fieldcontain"><label for="fechaHora"> <g:message
								code="cobro.fechaHora.label" default="Fecha" /> <span
							class="required-indicator">*</span>
					</label> <g:datePicker name="fechaHora" precision="day"
							value="${asistenciaInstance?.fechaHora}" /></li>
					<li class="fieldcontain"><label class="property-label">
							<g:message code="cobro.socio.label" default="Socio" />
					</label> <span class="property-value" aria-labelledby="perfilDeSocio-label">
							${asistenciaInstance?.socio?.encodeAsHTML()}
							<input id="socio" type="hidden" value="${asistenciaInstance?.socio?.id}" name="socio.id">
							<input type="hidden" id="modalidades" value="${asistenciaInstance?.socio?.modalidadesAsJson()}"/>
					</span></li>

					<li class="fieldcontain"><label class="property-label">
							<g:message code="cobro.modalidad.label" default="Modalidad" />
					</label> 
							<span class="property-value" name="modalidades"></span>
					</li>
				</ol>
			</fieldset>
			<fieldset class="buttons">
				<g:submitButton name="create" class="save"
					value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</fieldset>
		</g:form>
	</div>
	<script type="text/javascript">

if (typeof jQuery !== 'undefined') {	
	$(function() {

		settingData($('[id=modalidades]')[0].value);

		
		function settingData(data){
			var json = eval(data) ;
			if(json.length==1){
					$("[name=modalidades]").html(json[0].descripcion);
					$("[name=modalidades]").append("<input  id='perfil' name='perfil.id' type='hidden' value='"+json[0].id+"' />");
					
				}else{
					$("[name=modalidades]").html("");
					for(var i=0; i<json.length;i++){					
						$("[name=modalidades]").append("<input type='radio' "+(i==0?"checked":"")+" onclick='handleClick(this);' name='perfil.id' value='"+json[i].id+"' montoValue='"+json[i].arancel+"' />"+json[i].descripcion+"<br>");						
					}
				}
		}

		
		
	});
}
</script>
</body>
</html>
