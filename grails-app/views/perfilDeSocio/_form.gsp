<%@ page import="com.pulko.siurana.core.PerfilDeSocio" %>



<div class="fieldcontain ${hasErrors(bean: perfilDeSocioInstance, field: 'perfil', 'error')} required">
	<label for="perfil">
		<g:message code="perfilDeSocio.perfil.label" default="Perfil" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="perfil" name="perfil.id" from="${com.pulko.siurana.core.Perfil.list()}" optionKey="id" required="" value="${perfilDeSocioInstance?.perfil?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: perfilDeSocioInstance, field: 'socio', 'error')} required">
	<label for="socio">
		<g:message code="perfilDeSocio.socio.label" default="Socio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="socio" name="socio.id" from="${com.pulko.siurana.core.Socio.list(sort: apellido).sort{it.apellido}}" optionKey="id" required="" value="${perfilDeSocioInstance?.socio?.id}" class="many-to-one"/>
</div>

