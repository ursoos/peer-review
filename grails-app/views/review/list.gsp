
<%@ page import="peer.review.Review" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'review.label', default: 'Review')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-review" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-review" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="review.creatorOfReview.label" default="Creator Of Review" /></th>
					
						<g:sortableColumn property="finished" title="${message(code: 'review.finished.label', default: 'Finished')}" />
					
						<th><g:message code="review.personToReview.label" default="Person To Review" /></th>
					
						<g:sortableColumn property="whenCreated" title="${message(code: 'review.whenCreated.label', default: 'When Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${reviewInstanceList}" status="i" var="reviewInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${reviewInstance.id}">${fieldValue(bean: reviewInstance, field: "creatorOfReview")}</g:link></td>
					
						<td><g:formatBoolean boolean="${reviewInstance.finished}" /></td>
					
						<td>${fieldValue(bean: reviewInstance, field: "personToReview")}</td>
					
						<td><g:formatDate date="${reviewInstance.whenCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${reviewInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
