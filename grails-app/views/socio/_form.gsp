<%@ page import="com.pulko.siurana.core.Socio" %>



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

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'nroDocumento', 'error')} required">
	<label for="nroDocumento">
		<g:message code="socio.nroDocumento.label" default="Nro Documento" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nroDocumento" maxlength="10" required="" value="${socioInstance?.nroDocumento}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'fechaDeNacimiento', 'error')} ">
	<label for="fechaDeNacimiento">
		<g:message code="socio.fechaDeNacimiento.label" default="Fecha De Nacimiento" />
		
	</label>
	<g:datePicker name="fechaDeNacimiento" format="dd/MM/yyyy" precision="day"  value="${socioInstance?.fechaDeNacimiento}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'telefono', 'error')} ">
	<label for="telefono">
		<g:message code="socio.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" value="${socioInstance?.telefono}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="socio.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${socioInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'sexo', 'error')} required">
	<label for="sexo">
		<g:message code="socio.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sexo" from="${socioInstance.constraints.sexo.inList}" required="" value="${socioInstance?.sexo}" valueMessagePrefix="socio.sexo"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="socio.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${socioInstance?.activo}" />

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'comentarios', 'error')} ">
	<label for="comentarios">
		<g:message code="socio.comentarios.label" default="Comentarios" />
		
	</label>
	<g:textArea name="comentarios" cols="40" rows="5" value="${socioInstance?.comentarios}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'asistencias', 'error')} ">
	<label for="asistencias">
		<g:message code="socio.asistencias.label" default="Asistencias" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${socioInstance?.asistencias?}" var="a">
    <li><g:link controller="asistencia" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: socioInstance, field: 'perfilesDeSocio', 'error')} ">
	<label for="perfilesDeSocio">
		<g:message code="socio.perfilesDeSocio.label" default="Perfiles De Socio" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${socioInstance?.perfilesDeSocio?}" var="p">
    <li><g:link controller="perfilDeSocio" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>


</div>

