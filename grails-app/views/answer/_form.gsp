<%@ page import="peer.review.Answer" %>



<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'grade', 'error')} ">
	<label for="grade">
		<g:message code="answer.grade.label" default="Grade" />
		
	</label>
	<g:select name="grade" from="${answerInstance.constraints.grade.inList}" value="${answerInstance?.grade}" valueMessagePrefix="answer.grade" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'freeFormAnswer', 'error')} ">
	<label for="freeFormAnswer">
		<g:message code="answer.freeFormAnswer.label" default="Free Form Answer" />
		
	</label>
	<g:textField name="freeFormAnswer" value="${answerInstance?.freeFormAnswer}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'questionToAnswer', 'error')} required">
	<label for="questionToAnswer">
		<g:message code="answer.questionToAnswer.label" default="Question To Answer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="questionToAnswer" name="questionToAnswer.id" from="${peer.review.Question.list()}" optionKey="id" required="" value="${answerInstance?.questionToAnswer?.id}" class="many-to-one"/>
</div>

