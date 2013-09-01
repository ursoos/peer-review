<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Please login</title>
		<style type="text/css" media="screen">
		.error {
			color: red;
			font-weight: bold;
			font-size: large;
			
		}
		table {
			width: 60%;
		}
				
		
		
		</style>
</head>
	<body>
	  <div class="body">
	  	
	   	<div class="loginform">
	  	<g:form name="loginForm" url="[controller:'person',action:'login']">
	  	<table>
		  	<tr>
		  		<td>login:</td><td><g:textField name="login" /></td><td class="error">${userMessage}</td>
		  	</tr>
	  		<tr>
	  	 		<td>password:</td><td><g:passwordField name="password"/></td><td class="error">${passwordMessage}</td>
	  	 	</tr>
	  		<tr>
	  			<td></td>
	  			<td>
	  				<g:actionSubmit value="Sign in" action="login"/>
  				</td>
	  		</tr>
	  	</table>
	  	</g:form>
	  	</div>
	  </div>
	  	  
	</body>
</html>