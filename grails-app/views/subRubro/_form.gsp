<%@ page import="com.pulko.siurana.fi.SubRubro" %>

<div class="fieldcontain ${hasErrors(bean: subRubroInstance, field: 'rubro', 'error')} required">
	<label for="rubro">
		<g:message code="subRubro.rubro.label" default="Rubro" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="rubro" name="rubro.id" from="${com.pulko.siurana.fi.Rubro.list()}" optionKey="id" required="" value="${subRubroInstance?.rubro?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subRubroInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="subRubro.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${subRubroInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subRubroInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="subRubro.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${subRubroInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subRubroInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="subRubro.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="tipo" from="${subRubroInstance.constraints.tipo.inList}" required="" value="${subRubroInstance?.tipo}" valueMessagePrefix="subRubro.tipo"/>

</div>



