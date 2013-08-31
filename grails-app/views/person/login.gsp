<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Please login</title>
</head>
<body>
  <div class="body">
  <g:if test="${message != null }">
  
  	${message }
  </g:if>
  
  <g:form name="loginForm" url="[controller:'person',action:'login']">
  login: <g:textField name="login"/> <br/>
  password: <g:passwordField name="password"/>
  
  <g:actionSubmit value="login" action="login"/>
  </g:form>
  </div>
</body>
</html>