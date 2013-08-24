package peer.review

import org.springframework.dao.DataIntegrityViolationException

class ReviewerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [reviewerInstanceList: Reviewer.list(params), reviewerInstanceTotal: Reviewer.count()]
    }

    def create() {
        [reviewerInstance: new Reviewer(params)]
    }

    def save() {
        def reviewerInstance = new Reviewer(params)
        if (!reviewerInstance.save(flush: true)) {
            render(view: "create", model: [reviewerInstance: reviewerInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'reviewer.label', default: 'Reviewer'), reviewerInstance.id])
        redirect(action: "show", id: reviewerInstance.id)
    }

    def show(Long id) {
        def reviewerInstance = Reviewer.get(id)
        if (!reviewerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reviewer.label', default: 'Reviewer'), id])
            redirect(action: "list")
            return
        }

        [reviewerInstance: reviewerInstance]
    }

    def edit(Long id) {
        def reviewerInstance = Reviewer.get(id)
        if (!reviewerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reviewer.label', default: 'Reviewer'), id])
            redirect(action: "list")
            return
        }

        [reviewerInstance: reviewerInstance]
    }

    def update(Long id, Long version) {
        def reviewerInstance = Reviewer.get(id)
        if (!reviewerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reviewer.label', default: 'Reviewer'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (reviewerInstance.version > version) {
                reviewerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'reviewer.label', default: 'Reviewer')] as Object[],
                          "Another user has updated this Reviewer while you were editing")
                render(view: "edit", model: [reviewerInstance: reviewerInstance])
                return
            }
        }

        reviewerInstance.properties = params

        if (!reviewerInstance.save(flush: true)) {
            render(view: "edit", model: [reviewerInstance: reviewerInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'reviewer.label', default: 'Reviewer'), reviewerInstance.id])
        redirect(action: "show", id: reviewerInstance.id)
    }

    def delete(Long id) {
        def reviewerInstance = Reviewer.get(id)
        if (!reviewerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reviewer.label', default: 'Reviewer'), id])
            redirect(action: "list")
            return
        }

        try {
            reviewerInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'reviewer.label', default: 'Reviewer'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'reviewer.label', default: 'Reviewer'), id])
            redirect(action: "show", id: id)
        }
    }
	def reviews(Long id) {
		
		redirect(action: "show", id: reviewerInstance.id)
	}

		
	
}
