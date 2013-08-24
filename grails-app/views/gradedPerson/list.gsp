
<%@ page import="peer.review.GradedPerson" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'gradedPerson.label', default: 'GradedPerson')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-gradedPerson" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-gradedPerson" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="firstName" title="${message(code: 'gradedPerson.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="initials" title="${message(code: 'gradedPerson.initials.label', default: 'Initials')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'gradedPerson.lastName.label', default: 'Last Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${gradedPersonInstanceList}" status="i" var="gradedPersonInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${gradedPersonInstance.id}">${fieldValue(bean: gradedPersonInstance, field: "firstName")}</g:link></td>
					
						<td>${fieldValue(bean: gradedPersonInstance, field: "initials")}</td>
					
						<td>${fieldValue(bean: gradedPersonInstance, field: "lastName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${gradedPersonInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
