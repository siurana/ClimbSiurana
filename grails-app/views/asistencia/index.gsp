
<%@ page import="com.pulko.siurana.core.Asistencia" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'asistencia.label', default: 'Asistencia')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-asistencia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-asistencia" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
				<g:form autocomplete="off" url="[resource:socioInstance, action:'index']" method="GET" >
			<fieldset class="filtrarPor">
				<legend>Filtrar por</legend>
				<div class="fieldcontain">
					<label><g:message code="socio.nombre.label"
							default="Nombre" /></label>
					<g:textField name="nombre" value="${params.nombre}" />
					<label><g:message code="socio.apellido.label"
							default="Apellido" /></label>
					<g:textField name="apellido" value="${params.apellido}" />
					<br><br> 
					<label for="perfil">Dia
					</label>					
					<input type="radio" name="filterDate" value="filterDay" class="toHide"><g:datePicker name="fecha_dia" format="dd/MM/yyyy" precision="day"  value="${!params.fecha?new Date():params.fecha}" default="none" noSelection="['': '']" />
					<br><br> 
					<label for="perfil">Mes
					</label>
					<input type="radio" name="filterDate" value="filterMonth" class="toHide"> <g:datePicker name="fecha_mes" format="MM/yyyy" precision="month"  value="${!params.fecha?new Date():params.fecha}" default="none" noSelection="['': '']" />
					
				</div>
				<fieldset>
					<g:submitButton name="create" class="save" value="Filtrar" />
				</fieldset>
			</fieldset>
		</g:form>
			<table>
			<thead>
					<tr>
						<th><g:message code="asistencia.socio.label" default="Socio" /></th>
						<th><g:message code="asistencia.fechaHora.label" default= "Fecha Hora"/></th>					
						<th><g:message code="asistencia.perfil.label" default="Perfil" /></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${asistenciaInstanceList}" status="i" var="asistenciaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${asistenciaInstance.id}">${fieldValue(bean: asistenciaInstance, field: "socio")}</g:link></td>
						<td>${fieldValue(bean: asistenciaInstance, field: "fechaHora")}</td>					
						<td>${fieldValue(bean: asistenciaInstance, field: "perfil")}</td>					
					</tr>
				</g:each>
				</tbody>
			</table>
	
		</div>
		<script>
$(document).ready(function() {
    $('input:radio[name=filterDate]').click(function(){
        	var first=true;
            if($(this).val() == "filterMonth"){
            	first=false;
            } 
            $('#fecha_dia_day').prop('disabled', !first);
            $('#fecha_dia_month').prop('disabled', !first);
            $('#fecha_dia_year').prop('disabled', !first);
            $('#fecha_mes_month').prop('disabled', first);
            $('#fecha_mes_year').prop('disabled', first);
    });
 });
</script>
	</body>
</html>


