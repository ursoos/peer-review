
<%@ page import="peer.review.Reviewer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reviewer.label', default: 'Reviewer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-reviewer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-reviewer" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="firstName" title="${message(code: 'reviewer.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="initials" title="${message(code: 'reviewer.initials.label', default: 'Initials')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'reviewer.lastName.label', default: 'Last Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${reviewerInstanceList}" status="i" var="reviewerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${reviewerInstance.id}">${fieldValue(bean: reviewerInstance, field: "firstName")}</g:link></td>
					
						<td>${fieldValue(bean: reviewerInstance, field: "initials")}</td>
					
						<td>${fieldValue(bean: reviewerInstance, field: "lastName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${reviewerInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
