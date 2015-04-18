<%@ page import="com.pulko.siurana.core.Socio" %>


<h3>Datos Socio</h3>
<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="socio.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${socioInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'apellido', 'error')} required">
	<label for="apellido">
		<g:message code="socio.apellido.label" default="Apellido" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellido" required="" value="${socioInstance?.apellido}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'dNI', 'error')} ">
	<label for="dNI">
		<g:message code="socio.dNI.label" default="DNI" />
		
	</label>
	<g:textField name="dNI" maxlength="10" value="${socioInstance?.dNI}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'fechaDeNacimiento', 'error')} ">
	<label for="fechaDeNacimiento">
		<g:message code="socio.fechaDeNacimiento.label" default="Fecha De Nacimiento" />
		
	</label>
	<g:datePicker name="fechaDeNacimiento" format="dd/MM/yyyy" precision="day"  value="${socioInstance?.fechaDeNacimiento}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'domicilio', 'error')} ">
	<label for="domicilio">
		<g:message code="socio.domicilio.label" default="Domicilio" />
		
	</label>
	<g:textArea name="domicilio" cols="40" rows="5" value="${socioInstance?.domicilio}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="socio.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${socioInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'telefono', 'error')} ">
	<label for="telefono">
		<g:message code="socio.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" value="${socioInstance?.telefono}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'celular', 'error')} ">
	<label for="celular">
		<g:message code="socio.celular.label" default="Celular" />
		
	</label>
	<g:textField name="celular" value="${socioInstance?.celular}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'sexo', 'error')} required">
	<label for="sexo">
		<g:message code="socio.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sexo" from="${socioInstance.constraints.sexo.inList}" required="" value="${socioInstance?.sexo}" valueMessagePrefix="socio.sexo"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'esMenor', 'error')} ">
	<label for="esMenor">
		<g:message code="socio.esMenor.label" default="Es Menor" />
		
	</label>
	<g:checkBox name="esMenor" value="${socioInstance?.esMenor}" />

</div>

<div id="contactoEmergencia">
<h3>Datos del contacto de emergencia</h3>
<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'nombreContactoDeEmergencia', 'error')} ">
	<label for="nombreContactoDeEmergencia">
		<g:message code="socio.nombreContactoDeEmergencia.label" default="Nombre" />
		
	</label>
	<g:textField name="nombreContactoDeEmergencia" value="${socioInstance?.nombreContactoDeEmergencia}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'apellidoContactoDeEmergencia', 'error')} ">
	<label for="apellidoContactoDeEmergencia">
		<g:message code="socio.apellidoContactoDeEmergencia.label" default="Apellido" />
		
	</label>
	<g:textField name="apellidoContactoDeEmergencia" value="${socioInstance?.apellidoContactoDeEmergencia}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'telefonoContactoDeEmergencia', 'error')} ">
	<label for="telefonoContactoDeEmergencia">
		<g:message code="socio.telefonoContactoDeEmergencia.label" default="Telefono" />
		
	</label>
	<g:textField name="telefonoContactoDeEmergencia" value="${socioInstance?.telefonoContactoDeEmergencia}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'celularContactoDeEmergencia', 'error')} ">
	<label for="celularContactoDeEmergencia">
		<g:message code="socio.celularContactoDeEmergencia.label" default="Celular" />
		
	</label>
	<g:textField name="celularContactoDeEmergencia" value="${socioInstance?.celularContactoDeEmergencia}"/>

</div>
</div>
<div id="contactoPadres">
<h3>Datos del Padre</h3>
<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'nombreDelPadre', 'error')} ">
	<label for="nombreDelPadre">
		<g:message code="socio.nombreDelPadre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombreDelPadre" value="${socioInstance?.nombreDelPadre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'apellidoDelPadre', 'error')} ">
	<label for="apellidoDelPadre">
		<g:message code="socio.apellidoDelPadre.label" default="Apellido" />
		
	</label>
	<g:textField name="apellidoDelPadre" value="${socioInstance?.apellidoDelPadre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'dNIDelPadre', 'error')} ">
	<label for="dNIDelPadre">
		<g:message code="socio.dNIDelPadre.label" default="DNI" />
		
	</label>
	<g:textField name="dNIDelPadre" maxlength="10" value="${socioInstance?.dNIDelPadre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'domicilioDelPadre', 'error')} ">
	<label for="domicilioDelPadre">
		<g:message code="socio.domicilioDelPadre.label" default="Domicilio" />
		
	</label>
	<g:textArea name="domicilioDelPadre" cols="40" rows="5" value="${socioInstance?.domicilioDelPadre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'emailDelPadre', 'error')} ">
	<label for="emailDelPadre">
		<g:message code="socio.emailDelPadre.label" default="Email" />
		
	</label>
	<g:field type="email" name="emailDelPadre" value="${socioInstance?.emailDelPadre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'telefonoDelPadre', 'error')} ">
	<label for="telefonoDelPadre">
		<g:message code="socio.telefonoDelPadre.label" default="Telefono" />
		
	</label>
	<g:textField name="telefonoDelPadre" value="${socioInstance?.telefonoDelPadre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'celularDelPadre', 'error')} ">
	<label for="celularDelPadre">
		<g:message code="socio.celularDelPadre.label" default="Celular" />
		
	</label>
	<g:textField name="celularDelPadre" value="${socioInstance?.celularDelPadre}"/>

</div>

<h3>Datos de la Madre</h3>
<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'nombreDeLaMadre', 'error')} ">
	<label for="nombreDeLaMadre">
		<g:message code="socio.nombreDeLaMadre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombreDeLaMadre" value="${socioInstance?.nombreDeLaMadre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'apellidoDeLaMadre', 'error')} ">
	<label for="apellidoDeLaMadre">
		<g:message code="socio.apellidoDeLaMadre.label" default="Apellido" />
		
	</label>
	<g:textField name="apellidoDeLaMadre" value="${socioInstance?.apellidoDeLaMadre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'dNIDeLaMadre', 'error')} ">
	<label for="dNIDeLaMadre">
		<g:message code="socio.dNIDeLaMadre.label" default="DNI" />
		
	</label>
	<g:textField name="dNIDeLaMadre" maxlength="10" value="${socioInstance?.dNIDeLaMadre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'domicilioDeLaMadre', 'error')} ">
	<label for="domicilioDeLaMadre">
		<g:message code="socio.domicilioDeLaMadre.label" default="Domicilio" />
		
	</label>
	<g:textArea name="domicilioDeLaMadre" cols="40" rows="5" value="${socioInstance?.domicilioDeLaMadre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'emailDeLaMadre', 'error')} ">
	<label for="emailDeLaMadre">
		<g:message code="socio.emailDeLaMadre.label" default="Email" />
		
	</label>
	<g:field type="email" name="emailDeLaMadre" value="${socioInstance?.emailDeLaMadre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'telefonoDeLaMadre', 'error')} ">
	<label for="telefonoDeLaMadre">
		<g:message code="socio.telefonoDeLaMadre.label" default="Telefono" />
		
	</label>
	<g:textField name="telefonoDeLaMadre" value="${socioInstance?.telefonoDeLaMadre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'celularDeLaMadre', 'error')} ">
	<label for="celularDeLaMadre">
		<g:message code="socio.celularDeLaMadre.label" default="Celular" />
		
	</label>
	<g:textField name="celularDeLaMadre" value="${socioInstance?.celularDeLaMadre}"/>

</div>
</div>

<h3>Datos Siurana</h3>
<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'fechaDeIngreso', 'error')} ">
	<label for="fechaDeIngreso">
		<g:message code="socio.fechaDeIngreso.label" default="Fecha De Ingreso" />
		
	</label>
	<g:datePicker name="fechaDeIngreso" format="dd/MM/yyyy" precision="day"  value="${socioInstance?.fechaDeIngreso}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones">
		<g:message code="socio.observaciones.label" default="Observaciones" />
		
	</label>
	<g:textArea name="observaciones" cols="40" rows="5" value="${socioInstance?.observaciones}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="socio.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${socioInstance?.activo}" />

</div>

<script>
$(function() {	
	if($('#esMenor').is(':checked')){
		$('#contactoEmergencia').hide();
	} else {
		$('#contactoPadres').hide();
	}
	
    $('#esMenor').change(function(){
    	if($('#esMenor').is(':checked')){
    		$('#contactoEmergencia').hide();
    		$('#contactoPadres').show('slow');
    	} else {
    		$('#contactoPadres').hide();
    		$('#contactoEmergencia').show('slow');
    	}
    });
 });
</script>
