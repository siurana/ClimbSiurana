<%@ page import="com.pulko.siurana.fi.Rubro" %>



<div class="fieldcontain ${hasErrors(bean: rubroInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="rubro.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${rubroInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: rubroInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="rubro.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${rubroInstance?.descripcion}"/>

</div>
<g:if test="${rubroInstance?.subRubros}">
<div class="fieldcontain ${hasErrors(bean: rubroInstance, field: 'subRubros', 'error')} ">
	<label for="subRubros">
		<g:message code="rubro.subRubros.label" default="Sub Rubros" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${rubroInstance?.subRubros?}" var="s">
    <li><g:link controller="subRubro" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>


</div>
</g:if>

