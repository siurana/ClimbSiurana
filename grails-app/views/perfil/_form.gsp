<%@ page import="com.pulko.siurana.core.Perfil" %>



<div class="fieldcontain ${hasErrors(bean: perfilInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="perfil.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${perfilInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: perfilInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="perfil.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" maxlength="50" required="" value="${perfilInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: perfilInstance, field: 'arancel', 'error')} required">
	<label for="arancel">
		<g:message code="perfil.arancel.label" default="Arancel" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="arancel" value="${fieldValue(bean: perfilInstance, field: 'arancel')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: perfilInstance, field: 'esLibre', 'error')} ">
	<label for="esLibre">
		<g:message code="perfil.esLibre.label" default="Es Libre" />
		
	</label>
	<g:checkBox name="esLibre" value="${perfilInstance?.esLibre}" />

</div>

<div class="fieldcontain ${hasErrors(bean: perfilInstance, field: 'nroDeClases', 'error')} ">
	<label for="nroDeClases">
		<g:message code="perfil.nroDeClases.label" default="Nro De Clases" />
		
	</label>
	<g:select name="nroDeClases" from="${perfilInstance.constraints.nroDeClases.inList}" value="${fieldValue(bean: perfilInstance, field: 'nroDeClases')}" valueMessagePrefix="perfil.nroDeClases" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: perfilInstance, field: 'asistencia', 'error')} ">
	<label for="asistencia">
		<g:message code="perfil.asistencia.label" default="Asistencia" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${perfilInstance?.asistencia?}" var="a">
    <li><g:link controller="asistencia" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="asistencia" action="create" params="['perfil.id': perfilInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'asistencia.label', default: 'Asistencia')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: perfilInstance, field: 'perfilesDeUsuario', 'error')} ">
	<label for="perfilesDeUsuario">
		<g:message code="perfil.perfilesDeUsuario.label" default="Perfiles De Usuario" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${perfilInstance?.perfilesDeUsuario?}" var="p">
    <li><g:link controller="perfilDeUsuario" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="perfilDeUsuario" action="create" params="['perfil.id': perfilInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'perfilDeUsuario.label', default: 'PerfilDeUsuario')])}</g:link>
</li>
</ul>


</div>

