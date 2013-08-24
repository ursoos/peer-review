package peer.review

class PopulateTestDataController {

	def index() {
		def ArrayList people = Person.list()
		if ( people.size == 0) {
			println ("Populating test data")
			def luke = new GradedPerson(firstName: "Luke", lastName: "Skywalker", initials: "LS")
			luke.save()
			def han =  new GradedPerson(firstName: "Han", lastName: "Solo", initials: "HS" )
			han.save()
			def bobba =  new GradedPerson(firstName: "Bobba", lastName: "Fett", initials: "BF" )
			bobba.save()
			def wedge =  new GradedPerson(firstName: "Wedge", lastName: "Antilles", initials: "WA" )
			wedge.save()
			def vader = new Reviewer (firstName: "Darth", lastName: "Vader", initials: "DV" )
			vader.save()
			def yoda = new Reviewer (firstName: "Yoda", lastName: "", initials: "Y" )
			yoda.save()
			
			def force = new Question (question:   "Is he able to flawlessly use the Force?", link : "starwars.com", 
				description : "Ability to use force is crucial therefore every *Jedi* \\n has to be expert!" )
			force.save()
			def lightsaber = new Question (question:   "What are his lightsaber skills?", link : "starwars.com", 
				description : "He/she needs to be at least able to use lightsaber in combat and deflect incoming projectiles" )
			lightsaber.save()
		}
		redirect(uri: '/')
	}
}
