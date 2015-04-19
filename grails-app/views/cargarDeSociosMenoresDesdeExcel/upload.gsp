<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Importar socios menores desde archivo Excel</title>
</head>

<body>
<div class="nav" role="navigation">
    <ul>
    </ul>
</div>

<div id="upload-data" class="content scaffold-create" role="main">
    <div class="content scaffold-create" role="main">
        <h1>Importar socios menores desde archivo Excel</h1>
        <g:if test="${flash.message}"><div class="message" role="status">${flash.message}</div></g:if>
        <g:if test="${flash.error}"><div class="errors" role="status">${flash.error}</div></g:if>
        <g:uploadForm action="doUpload">
        <br>
        <br>
            <fieldset class="form">
                <input type="file" name="file" />
            </fieldset>
            <br>
            
            <fieldset class="buttons">
                <g:submitButton name="doUpload" value="Importar" />
            </fieldset>
            
        </g:uploadForm>
    </div>
</div>
</body>
</html>