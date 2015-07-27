<%@ page import="com.pulko.siurana.core.Socio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'socio.label', default: 'Socio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-socio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-socio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list socio">
				<h3>Datos Socio</h3>
				<g:if test="${socioInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="socio.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${socioInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.apellido}">
				<li class="fieldcontain">
					<span id="apellido-label" class="property-label"><g:message code="socio.apellido.label" default="Apellido" /></span>
					
						<span class="property-value" aria-labelledby="apellido-label"><g:fieldValue bean="${socioInstance}" field="apellido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.dNI}">
				<li class="fieldcontain">
					<span id="dNI-label" class="property-label"><g:message code="socio.dNI.label" default="DNI" /></span>
					
						<span class="property-value" aria-labelledby="dNI-label"><g:fieldValue bean="${socioInstance}" field="dNI"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.fechaDeNacimiento}">
				<li class="fieldcontain">
					<span id="fechaDeNacimiento-label" class="property-label"><g:message code="socio.fechaDeNacimiento.label" default="Fecha De Nacimiento" /></span>
					
						<span class="property-value" aria-labelledby="fechaDeNacimiento-label"><g:formatDate format="dd/MM/yyyy" date="${socioInstance?.fechaDeNacimiento}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.domicilio}">
				<li class="fieldcontain">
					<span id="domicilio-label" class="property-label"><g:message code="socio.domicilio.label" default="Domicilio" /></span>
					
						<span class="property-value" aria-labelledby="domicilio-label"><g:fieldValue bean="${socioInstance}" field="domicilio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="socio.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${socioInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.telefono}">
				<li class="fieldcontain">
					<span id="telefono-label" class="property-label"><g:message code="socio.telefono.label" default="Telefono" /></span>
					
						<span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${socioInstance}" field="telefono"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.celular}">
				<li class="fieldcontain">
					<span id="celular-label" class="property-label"><g:message code="socio.celular.label" default="Celular" /></span>
					
						<span class="property-value" aria-labelledby="celular-label"><g:fieldValue bean="${socioInstance}" field="celular"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.sexo}">
				<li class="fieldcontain">
					<span id="sexo-label" class="property-label"><g:message code="socio.sexo.label" default="Sexo" /></span>
					
						<span class="property-value" aria-labelledby="sexo-label"><g:fieldValue bean="${socioInstance}" field="sexo"/></span>
					
				</li>
				</g:if>
				
				<li class="fieldcontain">
					<span id="fecha-ultimo-pago-label" class="property-label">Fecha del Ultimo Pago:</span>
					
						<span class="property-value" aria-labelledby="fecha-ultimo-pago-label">${socioInstance.whenWasTheLastPayment()}</span>
					
				</li>
			
				<li class="fieldcontain">
					<span id="esMenor-label" class="property-label"><g:message code="socio.esMenor.label" default="Es Menor" /></span>
					
						<span class="property-value" aria-labelledby="esMenor-label"><g:checkBox name="esMenor" disabled="true" value="${socioInstance?.esMenor}" /></span>
					
				</li>
			
				<div id="contactoEmergencia">
				<h3>Datos del contacto de emergencia</h3>
				<g:if test="${socioInstance?.nombreContactoDeEmergencia}">
				<li class="fieldcontain">
					<span id="nombreContactoDeEmergencia-label" class="property-label"><g:message code="socio.nombreContactoDeEmergencia.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombreContactoDeEmergencia-label"><g:fieldValue bean="${socioInstance}" field="nombreContactoDeEmergencia"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.apellidoContactoDeEmergencia}">
				<li class="fieldcontain">
					<span id="apellidoContactoDeEmergencia-label" class="property-label"><g:message code="socio.apellidoContactoDeEmergencia.label" default="Apellido" /></span>
					
						<span class="property-value" aria-labelledby="apellidoContactoDeEmergencia-label"><g:fieldValue bean="${socioInstance}" field="apellidoContactoDeEmergencia"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.telefonoContactoDeEmergencia}">
				<li class="fieldcontain">
					<span id="telefonoContactoDeEmergencia-label" class="property-label"><g:message code="socio.telefonoContactoDeEmergencia.label" default="Telefono" /></span>
					
						<span class="property-value" aria-labelledby="telefonoContactoDeEmergencia-label"><g:fieldValue bean="${socioInstance}" field="telefonoContactoDeEmergencia"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.celularContactoDeEmergencia}">
				<li class="fieldcontain">
					<span id="celularContactoDeEmergencia-label" class="property-label"><g:message code="socio.celularContactoDeEmergencia.label" default="Celular" /></span>
					
						<span class="property-value" aria-labelledby="celularContactoDeEmergencia-label"><g:fieldValue bean="${socioInstance}" field="celularContactoDeEmergencia"/></span>
					
				</li>
				</g:if>
			</div>
			<div id="contactoPadres">
			<h3>Datos del Padre</h3>
				<g:if test="${socioInstance?.nombreDelPadre}">
				<li class="fieldcontain">
					<span id="nombreDelPadre-label" class="property-label"><g:message code="socio.nombreDelPadre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombreDelPadre-label"><g:fieldValue bean="${socioInstance}" field="nombreDelPadre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.apellidoDelPadre}">
				<li class="fieldcontain">
					<span id="apellidoDelPadre-label" class="property-label"><g:message code="socio.apellidoDelPadre.label" default="Apellido" /></span>
					
						<span class="property-value" aria-labelledby="apellidoDelPadre-label"><g:fieldValue bean="${socioInstance}" field="apellidoDelPadre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.dNIDelPadre}">
				<li class="fieldcontain">
					<span id="dNIDelPadre-label" class="property-label"><g:message code="socio.dNIDelPadre.label" default="DNI" /></span>
					
						<span class="property-value" aria-labelledby="dNIDelPadre-label"><g:fieldValue bean="${socioInstance}" field="dNIDelPadre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.domicilioDelPadre}">
				<li class="fieldcontain">
					<span id="domicilioDelPadre-label" class="property-label"><g:message code="socio.domicilioDelPadre.label" default="Domicilio" /></span>
					
						<span class="property-value" aria-labelledby="domicilioDelPadre-label"><g:fieldValue bean="${socioInstance}" field="domicilioDelPadre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.emailDelPadre}">
				<li class="fieldcontain">
					<span id="emailDelPadre-label" class="property-label"><g:message code="socio.emailDelPadre.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="emailDelPadre-label"><g:fieldValue bean="${socioInstance}" field="emailDelPadre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.telefonoDelPadre}">
				<li class="fieldcontain">
					<span id="telefonoDelPadre-label" class="property-label"><g:message code="socio.telefonoDelPadre.label" default="Telefono" /></span>
					
						<span class="property-value" aria-labelledby="telefonoDelPadre-label"><g:fieldValue bean="${socioInstance}" field="telefonoDelPadre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.celularDelPadre}">
				<li class="fieldcontain">
					<span id="celularDelPadre-label" class="property-label"><g:message code="socio.celularDelPadre.label" default="Celular" /></span>
					
						<span class="property-value" aria-labelledby="celularDelPadre-label"><g:fieldValue bean="${socioInstance}" field="celularDelPadre"/></span>
					
				</li>
				</g:if>
				<h3>Datos de la Madre</h3>
				<g:if test="${socioInstance?.nombreDeLaMadre}">
				<li class="fieldcontain">
					<span id="nombreDeLaMadre-label" class="property-label"><g:message code="socio.nombreDeLaMadre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombreDeLaMadre-label"><g:fieldValue bean="${socioInstance}" field="nombreDeLaMadre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.apellidoDeLaMadre}">
				<li class="fieldcontain">
					<span id="apellidoDeLaMadre-label" class="property-label"><g:message code="socio.apellidoDeLaMadre.label" default="Apellido" /></span>
					
						<span class="property-value" aria-labelledby="apellidoDeLaMadre-label"><g:fieldValue bean="${socioInstance}" field="apellidoDeLaMadre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.dNIDeLaMadre}">
				<li class="fieldcontain">
					<span id="dNIDeLaMadre-label" class="property-label"><g:message code="socio.dNIDeLaMadre.label" default="DNI" /></span>
					
						<span class="property-value" aria-labelledby="dNIDeLaMadre-label"><g:fieldValue bean="${socioInstance}" field="dNIDeLaMadre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.domicilioDeLaMadre}">
				<li class="fieldcontain">
					<span id="domicilioDeLaMadre-label" class="property-label"><g:message code="socio.domicilioDeLaMadre.label" default="Domicilio" /></span>
					
						<span class="property-value" aria-labelledby="domicilioDeLaMadre-label"><g:fieldValue bean="${socioInstance}" field="domicilioDeLaMadre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.emailDeLaMadre}">
				<li class="fieldcontain">
					<span id="emailDeLaMadre-label" class="property-label"><g:message code="socio.emailDeLaMadre.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="emailDeLaMadre-label"><g:fieldValue bean="${socioInstance}" field="emailDeLaMadre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.telefonoDeLaMadre}">
				<li class="fieldcontain">
					<span id="telefonoDeLaMadre-label" class="property-label"><g:message code="socio.telefonoDeLaMadre.label" default="Telefono" /></span>
					
						<span class="property-value" aria-labelledby="telefonoDeLaMadre-label"><g:fieldValue bean="${socioInstance}" field="telefonoDeLaMadre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.celularDeLaMadre}">
				<li class="fieldcontain">
					<span id="celularDeLaMadre-label" class="property-label"><g:message code="socio.celularDeLaMadre.label" default="Celular" /></span>
					
						<span class="property-value" aria-labelledby="celularDeLaMadre-label"><g:fieldValue bean="${socioInstance}" field="celularDeLaMadre"/></span>
					
				</li>
				</g:if>
			   </div>

			    <h3>Datos Siurana</h3>
				<g:if test="${socioInstance?.fechaDeIngreso}">
				<li class="fieldcontain">
					<span id="fechaDeIngreso-label" class="property-label"><g:message code="socio.fechaDeIngreso.label" default="Fecha De Ingreso" /></span>
					
						<span class="property-value" aria-labelledby="fechaDeIngreso-label"><g:formatDate format="dd/MM/yyyy" date="${socioInstance?.fechaDeIngreso}" /></span>
					
				</li>
				</g:if>
				
				<g:if test="${socioInstance?.fechaDeAlta}">
				<li class="fieldcontain">
					<span id="fechaDeIngreso-label" class="property-label"><g:message code="socio.fechaDeIngreso.label" default="Fecha De Alta" /></span>
					
						<span class="property-value" aria-labelledby="fechaDeIngreso-label"><g:formatDate format="dd/MM/yyyy" date="${socioInstance?.fechaDeAlta}" /></span>
					
				</li>
				</g:if>
				
				<g:if test="${socioInstance?.fechaDeModificacion}">
				<li class="fieldcontain">
					<span id="fechaDeIngreso-label" class="property-label"><g:message code="socio.fechaDeIngreso.label" default="Ultima Modificacion" /></span>
					
						<span class="property-value" aria-labelledby="fechaDeIngreso-label"><g:formatDate format="dd/MM/yyyy" date="${socioInstance?.fechaDeModificacion}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.observaciones}">
				<li class="fieldcontain">
					<span id="observaciones-label" class="property-label"><g:message code="socio.observaciones.label" default="Observaciones" /></span>
					
						<span class="property-value" aria-labelledby="observaciones-label"><g:fieldValue bean="${socioInstance}" field="observaciones"/></span>
					
				</li>
				</g:if>
			
				<li class="fieldcontain">
					<span id="activo-label" class="property-label"><g:message code="socio.activo.label" default="Activo" /></span>
					
						<span class="property-value" aria-labelledby="activo-label"><g:checkBox name="esMenor" disabled="true" value="${socioInstance?.activo}" /></span>
					
				</li>
			
				<g:if test="${socioInstance?.asistencias}">
				<li class="fieldcontain">
					<span id="asistencias-label" class="property-label"><g:message code="socio.asistencias.label" default="Asistencias" /></span>
					
						<g:each in="${socioInstance.asistencias}" var="a">
						<span class="property-value" aria-labelledby="asistencias-label">${a?.encodeAsHTML()}</span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${socioInstance?.modalidades}">
				<li class="fieldcontain">
					<span id="modalidades-label" class="property-label"><g:message code="socio.modalidades.label" default="Modalidades" /></span>					
						<g:each in="${socioInstance.modalidades}" var="m">
						<span class="property-value" aria-labelledby="modalidades-label">${m?.perfil?.encodeAsHTML()}
						<g:link name="modalidadRemove" action="removeModalidad" controller="socio" id="${m?.id}"><span class="remove" ></span></g:link>
						</span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:socioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${socioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					<g:link action="createPerfilDeSocio" params="['socio.id': socioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'perfilDeSocio.label', default: 'Modalidad')])}</g:link>
					<g:link controller="asistencia" action="createFromSocio" params="['socio.id': socioInstance?.id]">Agregar Asistencia</g:link>
				</fieldset>
			</g:form>
		</div>
		<script>
			$(function() {	
				    if($('#esMenor').is(':checked')){
				        $('#contactoEmergencia').hide();
				    } else {
				        $('#contactoPadres').hide();
				    }				
				$('[name=modalidadRemove]').click(function(event) {					
			        $(this).parent().hide(2000);  					
			    });
							
			 });
		</script>
	</body>
</html>
