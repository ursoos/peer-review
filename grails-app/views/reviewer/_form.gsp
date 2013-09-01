<%@ page import="peer.review.Reviewer" %>



<div class="fieldcontain ${hasErrors(bean: reviewerInstance, field: 'reviews', 'error')} ">
	<label for="reviews">
		<g:message code="reviewer.reviews.label" default="Reviews" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${reviewerInstance?.reviews?}" var="r">
    <li><g:link controller="review" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="review" action="create" params="['reviewer.id': reviewerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'review.label', default: 'Review')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: reviewerInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="reviewer.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${reviewerInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reviewerInstance, field: 'initials', 'error')} ">
	<label for="initials">
		<g:message code="reviewer.initials.label" default="Initials" />
		
	</label>
	<g:textField name="initials" value="${reviewerInstance?.initials}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reviewerInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="reviewer.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${reviewerInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reviewerInstance, field: 'login', 'error')} ">
	<label for="login">
		<g:message code="reviewer.login.label" default="Login" />
		
	</label>
	<g:textField name="login" value="${reviewerInstance?.login}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reviewerInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="reviewer.password.label" default="Password" />
		
	</label>
	<g:textField name="password" value="${reviewerInstance?.password}"/>
</div>

