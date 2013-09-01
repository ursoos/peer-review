import peer.review.*

class BootStrap {

	def init = { servletContext ->

		println ("Populating test data")
		//People to be graded
		def luke = new GradedPerson(firstName: "Luke", lastName: "Skywalker", initials: "LS", login: "luke", password: "luke" )
		luke.save()
		def han =  new GradedPerson(firstName: "Han", lastName: "Solo", initials: "HS", login: "han", password: "solo" )
		han.save()
		def bobba =  new GradedPerson(firstName: "Bobba", lastName: "Fett", initials: "BF" , login: "bff", password: "yay")
		bobba.save()
		def wedge =  new GradedPerson(firstName: "Wedge", lastName: "Antilles", initials: "WA", login: "xwing" ,password: "rebel" )
		wedge.save()
		
		//graders
		def vader = new Reviewer (firstName: "Darth", lastName: "Vader", initials: "DV", login : "lord", password :"padme" )
		vader.save()
		def yoda = new Reviewer (firstName: "Yoda", lastName: " ", initials: "Y", login: "giant", password : "aa"  )
		yoda.save()

		//couple questions
		def force = new Question (question:   "Is he able to flawlessly use the Force?", link : "starwars.com",
		description : "Ability to use force is crucial therefore every *Jedi* \\n has to be expert!" )
		force.save()
		def lightsaber = new Question (question:   "What are his lightsaber skills?", link : "starwars.com",
		description : "He/she needs to be at least able to use lightsaber in combat and deflect incoming projectiles" )
		lightsaber.save()
		
	}
	def destroy = {
	}
}
