<%@ page import="com.pulko.siurana.core.Asistencia" %>


<ol class="property-list cobro">
<li class="fieldcontain">
	<label for="fechaHora">
		<g:message code="cobro.fechaHora.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaHora" precision="day"  value="${asistenciaInstance?.fechaHora}"  />

</li>
<li class="fieldcontain">
	<label class="property-label">
		<g:message code="cobro.socio.label" default="Socio" />
	</label>
	<g:if test="${!asistenciaInstance?.id}">
		<select id="socio" name="socio.id" required="" class="many-to-one">	
			<g:each in="${com.pulko.siurana.core.Socio.list(sort: apellido).sort{it.apellido}}" status="i" var="socioInstance">
				<g:if test="${socioInstance?.activo}">
					<option value="${socioInstance?.id}" modalidades="${socioInstance.modalidadesAsJson()}">${socioInstance}</option>
				</g:if>
			</g:each>	
		</select>
	</g:if>
	<g:if test="${asistenciaInstance?.id}">
		<span class="property-value" aria-labelledby="perfilDeSocio-label">${asistenciaInstance?.socio?.encodeAsHTML()}</span>
	</g:if>
</li>

<li class="fieldcontain">
	<label class="property-label">
		<g:message code="cobro.modalidad.label" default="Modalidad" />
	</label>
	<g:if test="${!asistenciaInstance?.id}">
		<span  class="property-value"  name="modalidades"></span>
	</g:if>
	<g:if test="${asistenciaInstance?.id}">
		<span class="property-value" aria-labelledby="perfilDeSocio-label">${asistenciaInstance?.perfil?.encodeAsHTML()}</span>
	</g:if>
</li>
</ol>
<g:if test="${!cobroInstance?.id}">
<script type="text/javascript">

function handleClick(myRadio) {    
	$('[name=monto]').val(myRadio.attributes.montoValue.value);
}

if (typeof jQuery !== 'undefined') {	
	$(function() {

		settingData($('[id=socio]')[0].options[0].attributes.modalidades.value);

		$('[id=socio]').on('change', function() {			
			settingData(this.selectedOptions[0].attributes.modalidades.value);
		})

		function settingData(data){
			var json = eval(data) ;
			if(json.length==1){
					$("[name=modalidades]").html(json[0].descripcion);
					$("[name=modalidades]").append("<input  id='perfil' name='perfil.id' type='hidden' value='"+json[0].id+"' />");
					
				}else{
					$("[name=modalidades]").html("");
					for(var i=0; i<json.length;i++){					
						$("[name=modalidades]").append("<input type='radio' "+(i==0?"checked":"")+" onclick='handleClick(this);' name='perfil.id' value='"+json[i].id+"' montoValue='"+json[i].arancel+"' />"+json[i].descripcion+"<br>");						
					}
				}
		}

		
		
	});
}
</script>
</g:if>