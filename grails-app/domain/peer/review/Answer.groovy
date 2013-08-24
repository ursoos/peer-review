package peer.review

class Answer {
	Question questionToAnswer
	String freeFormAnswer
	String grade

	static constraints = {
		grade(inList: ["Unsatisfactory", "Partially Successful", "Successful", "Highly Successful", "Outstanding"])
	}
}
