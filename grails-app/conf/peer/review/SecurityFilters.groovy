package peer.review

class SecurityFilters {


	def filters = {
		loginCheck(controller: '*', action: '*') {
			before = {
				if (!session.user && actionName != "login") {
					redirect(controller: "person", action: "login")

					return true
				}
			}
		}
	}
}


