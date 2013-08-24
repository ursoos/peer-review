package peer.review

class Reviewer extends Person{
	
	static hasMany = [reviews: Review]
	static constraints = { reviews nullable: true }
	
}
