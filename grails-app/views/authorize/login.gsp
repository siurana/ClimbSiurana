<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
<meta name="layout" content="main" />
<title>Welcome to Ideas v<g:meta name="app.version"/></title>

</head>
<body>
	<div class="content scaffold-create" style="background-image: url('${resource(dir: 'images', file: 'siurana_just_logo.jpg')}'); background-repeat: no-repeat;  background-attachment: fixed; background-position: 300px 0px; ">
		<h1>Access to Site</h1>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<g:form action="authenticate" method="post">
			<fieldset class="form">
				<div  style="margin-top: 50px;"
					class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'userName', 'error')} required">
					<label for="userName"> <g:message
							code="usuario.userName.label" default="User" /> <span
						class="required-indicator">*</span>
					</label>
					<g:field type="text" name="userName" required=""
						value="${fieldValue(bean: userInstance, field: 'userName')}" />
				</div>
				<div style="margin-bottom: 30px;"
					class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'password', 'error')} ">
					<label for="password"> <g:message
							code="usuario.password.label" default="password" />

					</label>
					<g:field type="password" name="password" maxlength="32"
						value="${usuarioInstance?.password}" />
				</div>
			</fieldset>
			<fieldset class="buttons">
				<g:submitButton name="login" class="save" value="Enter" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
