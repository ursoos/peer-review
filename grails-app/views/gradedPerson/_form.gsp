<%@ page import="peer.review.GradedPerson" %>



<div class="fieldcontain ${hasErrors(bean: gradedPersonInstance, field: 'receivedReviews', 'error')} ">
	<label for="receivedReviews">
		<g:message code="gradedPerson.receivedReviews.label" default="Received Reviews" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${gradedPersonInstance?.receivedReviews?}" var="r">
    <li><g:link controller="review" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="review" action="create" params="['gradedPerson.id': gradedPersonInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'review.label', default: 'Review')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: gradedPersonInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="gradedPerson.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${gradedPersonInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gradedPersonInstance, field: 'initials', 'error')} ">
	<label for="initials">
		<g:message code="gradedPerson.initials.label" default="Initials" />
		
	</label>
	<g:textField name="initials" value="${gradedPersonInstance?.initials}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gradedPersonInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="gradedPerson.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${gradedPersonInstance?.lastName}"/>
</div>

