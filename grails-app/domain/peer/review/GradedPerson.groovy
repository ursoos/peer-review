package peer.review

class GradedPerson extends Person {

    static hasMany = [receivedReviews: Review]
	static constraints = { receivedReviews nullable: true }
}
