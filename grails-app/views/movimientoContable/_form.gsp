<%@ page import="com.pulko.siurana.fi.MovimientoContable" %>

<div class="fieldcontain ">
	<label for="subRubro">
		<g:message code="movimientoContable.rubro.label" default="Rubro" />
	</label>	
	<g:if test="${!movimientoContableInstance?.id}">
	<select id="rubro" name="rubro.id" class="many-to-one">	
			<g:each in="${com.pulko.siurana.fi.Rubro.list()}" status="i" var="rubroInstance">
				<option value="${rubroInstance?.id}" subRubros="${rubroInstance.subRubrosAsJson()}">${rubroInstance}</option>
			</g:each>	
		</select>
	</g:if>
	<g:if test="${movimientoContableInstance?.id}">
	${movimientoContableInstance?.subRubro?.rubro.encodeAsHTML()}
	</g:if>
</div>
<div class="fieldcontain ${hasErrors(bean: movimientoContableInstance, field: 'subRubro', 'error')} required">
	<label for="subRubro">
		<g:message code="movimientoContable.subRubro.label" default="Sub Rubro" />
	</label>
	<g:if test="${!movimientoContableInstance?.id}">
	<g:select id="subRubro" name="subRubro.id" from="${com.pulko.siurana.fi.SubRubro.list()}" optionKey="id" required="" value="${movimientoContableInstance?.subRubro?.id}" class="many-to-one"/>
	</g:if>
	<g:if test="${movimientoContableInstance?.id}">
	${movimientoContableInstance?.subRubro.encodeAsHTML()}
	</g:if>
</div>
<div class="fieldcontain ${hasErrors(bean: movimientoContableInstance, field: 'fechaHora', 'error')} required">
	<label for="fechaHora">
		<g:message code="movimientoContable.fechaHora.label" default="Fecha" />
	</label>
	<g:datePicker name="fechaHora" precision="day"  value="${movimientoContableInstance?.fechaHora}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoContableInstance, field: 'monto', 'error')} required">
	<label for="monto">
		<g:message code="movimientoContable.monto.label" default="Monto" />
	</label>
	<g:field name="monto" value="${fieldValue(bean: movimientoContableInstance, field: 'monto')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoContableInstance, field: 'detalle', 'error')} ">
	<label for="detalle">
		<g:message code="movimientoContable.detalle.label" default="Detalle" />
		
	</label>
	<g:textField name="detalle" value="${movimientoContableInstance?.detalle}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: movimientoContableInstance, field: 'responsable', 'error')} required">
	<label for="responsable">
		<g:message code="movimientoContable.responsable.label" default="Responsable" />
	</label>
	<span >${session?.usuario?.encodeAsHTML()}</span>
	<g:hiddenField name="responsable.id" value="${session.usuario.id}"/>

</div>
<g:if test="${!movimientoContableInstance?.id}">
<script type="text/javascript">

if (typeof jQuery !== 'undefined') {	
	$(function() {
		console.log('hola 1');
		settingData($('[id=rubro]')[0].options[0].attributes.subRubros.value);

		$('[id=rubro]').on('change', function() {			
			settingData(this.selectedOptions[0].attributes.subRubros.value);
		})

		function settingData(data){
			var json = eval(data) ;			
			$("[id=subRubro]").empty();
			for(var i=0; i<json.length;i++){					
				$("[id=subRubro]").append("<option value='"+json[i].id+"'>" + json[i].nombre + "</option>");						
			}				
		}
		
	});
}
</script>
</g:if>
