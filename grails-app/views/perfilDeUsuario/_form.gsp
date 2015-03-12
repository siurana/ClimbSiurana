<%@ page import="com.pulko.siurana.core.PerfilDeUsuario" %>



<div class="fieldcontain ${hasErrors(bean: perfilDeUsuarioInstance, field: 'perfil', 'error')} required">
	<label for="perfil">
		<g:message code="perfilDeUsuario.perfil.label" default="Perfil" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="perfil" name="perfil.id" from="${com.pulko.siurana.core.Perfil.list()}" optionKey="id" required="" value="${perfilDeUsuarioInstance?.perfil?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: perfilDeUsuarioInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="perfilDeUsuario.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${com.pulko.siurana.core.Usuario.list()}" optionKey="id" required="" value="${perfilDeUsuarioInstance?.usuario?.id}" class="many-to-one"/>

</div>

