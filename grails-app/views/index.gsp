<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main"/>
</head>
<body background="${resource(dir: 'images', file: 'siurana_just_logo.jpg')}">
<div class="nav moreBottomMargin"></div>
<g:if test="${flash.message}">
  <div class="message" role="status">${flash.message}</div>
</g:if>  

</body>
</html>
