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

<div class="fieldcontain ${hasErrors(bean: perfilInstance, field: 'asistencias', 'error')} ">
	<label for="asistencias">
		<g:message code="perfil.asistencias.label" default="Asistencias" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${perfilInstance?.asistencias?}" var="a">
    <li><g:link controller="asistencia" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="asistencia" action="create" params="['perfil.id': perfilInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'asistencia.label', default: 'Asistencia')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: perfilInstance, field: 'perfilesDeSocios', 'error')} ">
	<label for="perfilesDeSocios">
		<g:message code="perfil.perfilesDeSocios.label" default="Perfiles De Socios" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${perfilInstance?.perfilesDeSocios?}" var="p">
    <li><g:link controller="perfilDeSocio" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="perfilDeSocio" action="create" params="['perfil.id': perfilInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'perfilDeSocio.label', default: 'PerfilDeSocio')])}</g:link>
</li>
</ul>


</div>

