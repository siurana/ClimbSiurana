<%@ page import="com.pulko.siurana.core.Asistencia" %>



<div class="fieldcontain ${hasErrors(bean: asistenciaInstance, field: 'fechaHora', 'error')} ">
	<label for="fechaHora">
		<g:message code="asistencia.fechaHora.label" default="Fecha Hora" />
		
	</label>
	<g:datePicker name="fechaHora" format="dd/MM/yyyy - HH:mm" precision="day"  value="${asistenciaInstance?.fechaHora}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: asistenciaInstance, field: 'perfil', 'error')} required">
	<label for="perfil">
		<g:message code="asistencia.perfil.label" default="Perfil" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="perfil" name="perfil.id" from="${com.pulko.siurana.core.Perfil.list()}" optionKey="id" required="" value="${asistenciaInstance?.perfil?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: asistenciaInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="asistencia.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${com.pulko.siurana.core.Usuario.list()}" optionKey="id" required="" value="${asistenciaInstance?.usuario?.id}" class="many-to-one"/>

</div>

