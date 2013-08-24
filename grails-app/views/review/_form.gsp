<%@ page import="peer.review.Review" %>



<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'answers', 'error')} ">
	<label for="answers">
		<g:message code="review.answers.label" default="Answers" />
		
	</label>
	<g:select name="answers" from="${peer.review.Answer.list()}" multiple="multiple" optionKey="id" size="5" value="${reviewInstance?.answers*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'creatorOfReview', 'error')} required">
	<label for="creatorOfReview">
		<g:message code="review.creatorOfReview.label" default="Creator Of Review" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="creatorOfReview" name="creatorOfReview.id" from="${peer.review.Reviewer.list()}" optionKey="id" required="" value="${reviewInstance?.creatorOfReview?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'finished', 'error')} ">
	<label for="finished">
		<g:message code="review.finished.label" default="Finished" />
		
	</label>
	<g:checkBox name="finished" value="${reviewInstance?.finished}" />
</div>

<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'personToReview', 'error')} required">
	<label for="personToReview">
		<g:message code="review.personToReview.label" default="Person To Review" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="personToReview" name="personToReview.id" from="${peer.review.GradedPerson.list()}" optionKey="id" required="" value="${reviewInstance?.personToReview?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'whenCreated', 'error')} required">
	<label for="whenCreated">
		<g:message code="review.whenCreated.label" default="When Created" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="whenCreated" precision="day"  value="${reviewInstance?.whenCreated}"  />
</div>

