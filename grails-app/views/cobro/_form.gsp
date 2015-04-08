<%@ page import="com.pulko.siurana.fi.Cobro" %>

<div class="fieldcontain ${hasErrors(bean: cobroInstance, field: 'perfilDeSocio', 'error')} required">
	<label for="perfilDeSocio">
		<g:message code="cobro.perfilDeSocio.label" default="Socio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="perfilDeSocio" name="perfilDeSocio.id" from="${com.pulko.siurana.core.PerfilDeSocio.list()}" optionKey="id" required="" value="${cobroInstance?.perfilDeSocio?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cobroInstance, field: 'fechaHora', 'error')} required">
	<label for="fechaHora">
		<g:message code="cobro.fechaHora.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaHora" precision="day"  value="${cobroInstance?.fechaHora}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: cobroInstance, field: 'monto', 'error')} required">
	<label for="monto">
		<g:message code="cobro.monto.label" default="Monto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="monto" value="${fieldValue(bean: cobroInstance, field: 'monto')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: cobroInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="cobro.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${cobroInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cobroInstance, field: 'responsable', 'error')}">
	<label for="responsable">
		<g:message code="cobro.responsable.label" default="Responsable" />		
	</label>
	<span >${session?.usuario?.encodeAsHTML()}</span>

</div>

