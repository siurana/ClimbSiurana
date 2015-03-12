<%@ page import="com.pulko.siurana.core.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'userName', 'error')} required">
	<label for="userName">
		<g:message code="usuario.userName.label" default="User Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="userName" required="" value="${usuarioInstance?.userName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="usuario.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" required="" value="${usuarioInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="usuario.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${usuarioInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'apellido', 'error')} required">
	<label for="apellido">
		<g:message code="usuario.apellido.label" default="Apellido" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellido" required="" value="${usuarioInstance?.apellido}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nroDocumento', 'error')} required">
	<label for="nroDocumento">
		<g:message code="usuario.nroDocumento.label" default="Nro Documento" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nroDocumento" maxlength="10" required="" value="${usuarioInstance?.nroDocumento}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'fechaDeNacimiento', 'error')} ">
	<label for="fechaDeNacimiento">
		<g:message code="usuario.fechaDeNacimiento.label" default="Fecha De Nacimiento" />
		
	</label>
	<g:datePicker name="fechaDeNacimiento" precision="day"  value="${usuarioInstance?.fechaDeNacimiento}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'telefono', 'error')} required">
	<label for="telefono">
		<g:message code="usuario.telefono.label" default="Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefono" required="" value="${usuarioInstance?.telefono}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="usuario.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${usuarioInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'sexo', 'error')} required">
	<label for="sexo">
		<g:message code="usuario.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sexo" from="${usuarioInstance.constraints.sexo.inList}" required="" value="${usuarioInstance?.sexo}" valueMessagePrefix="usuario.sexo"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="usuario.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${usuarioInstance?.activo}" />

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'deleted', 'error')} ">
	<label for="deleted">
		<g:message code="usuario.deleted.label" default="Deleted" />
		
	</label>
	<g:checkBox name="deleted" value="${usuarioInstance?.deleted}" />

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'asistencias', 'error')} ">
	<label for="asistencias">
		<g:message code="usuario.asistencias.label" default="Asistencias" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${usuarioInstance?.asistencias?}" var="a">
    <li><g:link controller="asistencia" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="asistencia" action="create" params="['usuario.id': usuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'asistencia.label', default: 'Asistencia')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'perfilesDeUsuario', 'error')} ">
	<label for="perfilesDeUsuario">
		<g:message code="usuario.perfilesDeUsuario.label" default="Perfiles De Usuario" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${usuarioInstance?.perfilesDeUsuario?}" var="p">
    <li><g:link controller="perfilDeUsuario" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="perfilDeUsuario" action="create" params="['usuario.id': usuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'perfilDeUsuario.label', default: 'PerfilDeUsuario')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'rol', 'error')} required">
	<label for="rol">
		<g:message code="usuario.rol.label" default="Rol" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="rol" name="rol.id" from="${com.pulko.siurana.core.Rol.list()}" optionKey="id" required="" value="${usuarioInstance?.rol?.id}" class="many-to-one"/>

</div>

