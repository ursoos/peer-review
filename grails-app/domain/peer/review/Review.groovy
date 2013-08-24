package peer.review

class Review {
	static hasMany = [answers:Answer]
	Reviewer creatorOfReview
	GradedPerson personToReview
	Date whenCreated
	Boolean finished = false     
}

