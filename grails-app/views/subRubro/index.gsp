
<%@ page import="com.pulko.siurana.fi.SubRubro" %>
<%@ page import="com.pulko.siurana.fi.Rubro" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subRubro.label', default: 'SubRubro')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-subRubro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-subRubro" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<th width="11px"></th>					
						<th><g:message code="subRubro.rubro.label" default="Rubro" /></th>
						<th><g:message code="subRubro.nombre.label" default="SubRubro" /></th>
						<th><g:message code="subRubro.tipo.label" default="Tipo" /></th>					
					</tr>
				</thead>
				<g:each in="${Rubro.list(sort: nombre).sort{it.nombre}}" status="i" var="rubroInstance">
					<tbody class="rubroRow">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td class="turnPlus"></td>
							<td colspan="3">${fieldValue(bean: rubroInstance, field: "nombre")}</td>				
						</tr>
					</tbody>
					<tbody class="subRubroRow">	
						<g:each in="${rubroInstance.subRubros}" var="subRubroInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td colspan="2"></td>
								<td><g:link action="show" id="${subRubroInstance.id}">${fieldValue(bean: subRubroInstance, field: "nombre")}</g:link></td>					
								<td>${fieldValue(bean: subRubroInstance, field: "tipo")}</td>							
							</tr>					
						</g:each>
					</tbody>
				</g:each>
			</table>
		</div>
		<script type="text/javascript">
		jQuery(document).ready(function() {

			  jQuery(".subRubroRow").hide();
			  jQuery(".rubroRow").click(function()
			  {				
				jQuery(this).find("td:first-child").toggleClass( "turnPlus turnMinus");
			    jQuery(this).next(".subRubroRow").slideToggle("slow");
			  });
		});
		</script>
	</body>
</html>
