<%@ page import="peer.review.Person" %>



<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="person.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${personInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'initials', 'error')} ">
	<label for="initials">
		<g:message code="person.initials.label" default="Initials" />
		
	</label>
	<g:textField name="initials" value="${personInstance?.initials}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="person.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${personInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'login', 'error')} ">
	<label for="login">
		<g:message code="person.login.label" default="Login" />
		
	</label>
	<g:textField name="login" value="${personInstance?.login}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="person.password.label" default="Password" />
		
	</label>
	<g:textField name="password" value="${personInstance?.password}"/>
</div>

