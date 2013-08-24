
<%@ page import="peer.review.Review" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'review.label', default: 'Review')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-review" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-review" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list review">
			
				<g:if test="${reviewInstance?.answers}">
				<li class="fieldcontain">
					<span id="answers-label" class="property-label"><g:message code="review.answers.label" default="Answers" /></span>
					
						<g:each in="${reviewInstance.answers}" var="a">
						<span class="property-value" aria-labelledby="answers-label"><g:link controller="answer" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${reviewInstance?.creatorOfReview}">
				<li class="fieldcontain">
					<span id="creatorOfReview-label" class="property-label"><g:message code="review.creatorOfReview.label" default="Creator Of Review" /></span>
					
						<span class="property-value" aria-labelledby="creatorOfReview-label"><g:link controller="reviewer" action="show" id="${reviewInstance?.creatorOfReview?.id}">${reviewInstance?.creatorOfReview?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${reviewInstance?.finished}">
				<li class="fieldcontain">
					<span id="finished-label" class="property-label"><g:message code="review.finished.label" default="Finished" /></span>
					
						<span class="property-value" aria-labelledby="finished-label"><g:formatBoolean boolean="${reviewInstance?.finished}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${reviewInstance?.personToReview}">
				<li class="fieldcontain">
					<span id="personToReview-label" class="property-label"><g:message code="review.personToReview.label" default="Person To Review" /></span>
					
						<span class="property-value" aria-labelledby="personToReview-label"><g:link controller="gradedPerson" action="show" id="${reviewInstance?.personToReview?.id}">${reviewInstance?.personToReview?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${reviewInstance?.whenCreated}">
				<li class="fieldcontain">
					<span id="whenCreated-label" class="property-label"><g:message code="review.whenCreated.label" default="When Created" /></span>
					
						<span class="property-value" aria-labelledby="whenCreated-label"><g:formatDate date="${reviewInstance?.whenCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${reviewInstance?.id}" />
					<g:link class="edit" action="edit" id="${reviewInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
