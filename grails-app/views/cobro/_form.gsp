<%@ page import="com.pulko.siurana.fi.Cobro" %>

<ol class="property-list cobro">

<li class="fieldcontain">
	<label class="property-label">
		<g:message code="cobro.socio.label" default="Socio" />
	</label>
	<g:if test="${!cobroInstance?.id}">
		<select id="socio" name="socio.id" required="" class="many-to-one">	
			<g:each in="${com.pulko.siurana.core.Socio.list()}" status="i" var="socioInstance">
				<g:if test="${socioInstance?.activo}">
					<option value="${socioInstance?.id}" modalidades="${socioInstance.modalidadesAsJson()}">${socioInstance}</option>
				</g:if>
			</g:each>	
		</select>
	</g:if>
	<g:if test="${cobroInstance?.id}">
		<span class="property-value" aria-labelledby="perfilDeSocio-label">${cobroInstance?.socio?.encodeAsHTML()}</span>
	</g:if>
</li>

<li class="fieldcontain">
	<label class="property-label">
		<g:message code="cobro.modalidad.label" default="Modalidad" />
	</label>
	<g:if test="${!cobroInstance?.id}">
		<span  class="property-value"  name="modalidades"></span>
	</g:if>
	<g:if test="${cobroInstance?.id}">
		<span class="property-value" aria-labelledby="perfilDeSocio-label">${cobroInstance?.perfil?.encodeAsHTML()}</span>
	</g:if>
</li>

<li class="fieldcontain">
	<label for="fechaHora">
		<g:message code="cobro.fechaHora.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaHora" precision="day"  value="${cobroInstance?.fechaHora}"  />

</li>

<li class="fieldcontain">
	<label for="monto">
		<g:message code="cobro.monto.label" default="Monto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="monto" value="${fieldValue(bean: cobroInstance, field: 'monto')}" required=""/>

</li>

<li class="fieldcontain">
	<label for="descripcion">
		<g:message code="cobro.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${cobroInstance?.descripcion}"/>

</li>

<li class="fieldcontain">
	<label for="responsable">
		<g:message code="cobro.responsable.label" default="Responsable" />		
	</label>
	<span >${session?.usuario?.encodeAsHTML()}</span>
	<g:hiddenField name="responsable.id" value="${session.usuario.id}"/>

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
					$('[name=monto]').val(json[0].arancel);
				}else{
					$("[name=modalidades]").html("");
					for(var i=0; i<json.length;i++){
						if(i==0){
							$('[name=monto]').val(json[i].arancel);
						}
						$("[name=modalidades]").append("<input type='radio' "+(i==0?"checked":"")+" onclick='handleClick(this);' name='perfil.id' value='"+json[i].id+"' montoValue='"+json[i].arancel+"' />"+json[i].descripcion+"<br>");						
					}
				}
		}

		
		
	});
}
</script>
</g:if>
