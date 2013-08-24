
<%@ page import="peer.review.Answer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'answer.label', default: 'Answer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-answer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-answer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list answer">
			
				<g:if test="${answerInstance?.grade}">
				<li class="fieldcontain">
					<span id="grade-label" class="property-label"><g:message code="answer.grade.label" default="Grade" /></span>
					
						<span class="property-value" aria-labelledby="grade-label"><g:fieldValue bean="${answerInstance}" field="grade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${answerInstance?.freeFormAnswer}">
				<li class="fieldcontain">
					<span id="freeFormAnswer-label" class="property-label"><g:message code="answer.freeFormAnswer.label" default="Free Form Answer" /></span>
					
						<span class="property-value" aria-labelledby="freeFormAnswer-label"><g:fieldValue bean="${answerInstance}" field="freeFormAnswer"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${answerInstance?.questionToAnswer}">
				<li class="fieldcontain">
					<span id="questionToAnswer-label" class="property-label"><g:message code="answer.questionToAnswer.label" default="Question To Answer" /></span>
					
						<span class="property-value" aria-labelledby="questionToAnswer-label"><g:link controller="question" action="show" id="${answerInstance?.questionToAnswer?.id}">${answerInstance?.questionToAnswer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${answerInstance?.id}" />
					<g:link class="edit" action="edit" id="${answerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
