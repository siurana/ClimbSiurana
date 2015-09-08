<%@ page import="com.pulko.siurana.fi.CobroPorDia" %>


<div class="fieldcontain ${hasErrors(bean: cobroPorDiaInstance, field: 'socio', 'error')} required">
	<label for="socio">
		<g:message code="cobroPorDia.socio.label" default="Socio" />
		<span class="required-indicator">*</span>
	</label>
	<g:if test="${!cobroPorDiaInstance?.id}">
		<select id="socio" name="socio.id" required="" class="many-to-one">	
			<g:each in="${com.pulko.siurana.core.Socio.list(sort: apellido).sort{it.apellido}}" status="i" var="socioInstance">
				<g:if test="${socioInstance?.activo}">
					<option value="${socioInstance?.id}" modalidades="${socioInstance.modalidadesAsJson()}">${socioInstance}</option>
				</g:if>
			</g:each>	
		</select>
	</g:if>
	<g:if test="${cobroPorDiaInstance?.id}">
		<span class="property-value" aria-labelledby="perfilDeSocio-label">${cobroPorDiaInstance?.socio?.encodeAsHTML()}</span>
	</g:if>

</div>

<div class="fieldcontain ${hasErrors(bean: cobroPorDiaInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="cobroPorDia.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${cobroPorDiaInstance?.fecha}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: cobroPorDiaInstance, field: 'monto', 'error')} required">
	<label for="monto">
		<g:message code="cobroPorDia.monto.label" default="Monto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="monto" value="${fieldValue(bean: cobroPorDiaInstance, field: 'monto')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: cobroPorDiaInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="cobroPorDia.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${cobroPorDiaInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cobroPorDiaInstance, field: 'responsable', 'error')} required">
	<label for="responsable">
		<g:message code="cobroPorDia.responsable.label" default="Responsable" />
		<span class="required-indicator">*</span>
	</label>
	<span >${session?.usuario?.encodeAsHTML()}</span>
	<g:hiddenField name="responsable.id" value="${session.usuario.id}"/>

</div>



