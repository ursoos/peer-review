
<%@ page import="peer.review.GradedPerson" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'gradedPerson.label', default: 'GradedPerson')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-gradedPerson" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-gradedPerson" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list gradedPerson">
			
				<g:if test="${gradedPersonInstance?.receivedReviews}">
				<li class="fieldcontain">
					<span id="receivedReviews-label" class="property-label"><g:message code="gradedPerson.receivedReviews.label" default="Received Reviews" /></span>
					
						<g:each in="${gradedPersonInstance.receivedReviews}" var="r">
						<span class="property-value" aria-labelledby="receivedReviews-label"><g:link controller="review" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${gradedPersonInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="gradedPerson.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${gradedPersonInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gradedPersonInstance?.initials}">
				<li class="fieldcontain">
					<span id="initials-label" class="property-label"><g:message code="gradedPerson.initials.label" default="Initials" /></span>
					
						<span class="property-value" aria-labelledby="initials-label"><g:fieldValue bean="${gradedPersonInstance}" field="initials"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gradedPersonInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="gradedPerson.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${gradedPersonInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${gradedPersonInstance?.id}" />
					<g:link class="edit" action="edit" id="${gradedPersonInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
