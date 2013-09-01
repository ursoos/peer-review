
<%@ page import="peer.review.Reviewer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reviewer.label', default: 'Reviewer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-reviewer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-reviewer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list reviewer">
			
				<g:if test="${reviewerInstance?.reviews}">
				<li class="fieldcontain">
					<span id="reviews-label" class="property-label"><g:message code="reviewer.reviews.label" default="Reviews" /></span>
					
						<g:each in="${reviewerInstance.reviews}" var="r">
						<span class="property-value" aria-labelledby="reviews-label"><g:link controller="review" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${reviewerInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="reviewer.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${reviewerInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reviewerInstance?.initials}">
				<li class="fieldcontain">
					<span id="initials-label" class="property-label"><g:message code="reviewer.initials.label" default="Initials" /></span>
					
						<span class="property-value" aria-labelledby="initials-label"><g:fieldValue bean="${reviewerInstance}" field="initials"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reviewerInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="reviewer.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${reviewerInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reviewerInstance?.login}">
				<li class="fieldcontain">
					<span id="login-label" class="property-label"><g:message code="reviewer.login.label" default="Login" /></span>
					
						<span class="property-value" aria-labelledby="login-label"><g:fieldValue bean="${reviewerInstance}" field="login"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reviewerInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="reviewer.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${reviewerInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${reviewerInstance?.id}" />
					<g:link class="edit" action="edit" id="${reviewerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
