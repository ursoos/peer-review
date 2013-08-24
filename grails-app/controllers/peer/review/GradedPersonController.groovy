package peer.review

import org.springframework.dao.DataIntegrityViolationException

class GradedPersonController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [gradedPersonInstanceList: GradedPerson.list(params), gradedPersonInstanceTotal: GradedPerson.count()]
    }

    def create() {
        [gradedPersonInstance: new GradedPerson(params)]
    }

    def save() {
        def gradedPersonInstance = new GradedPerson(params)
        if (!gradedPersonInstance.save(flush: true)) {
            render(view: "create", model: [gradedPersonInstance: gradedPersonInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'gradedPerson.label', default: 'GradedPerson'), gradedPersonInstance.id])
        redirect(action: "show", id: gradedPersonInstance.id)
    }

    def show(Long id) {
        def gradedPersonInstance = GradedPerson.get(id)
        if (!gradedPersonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gradedPerson.label', default: 'GradedPerson'), id])
            redirect(action: "list")
            return
        }

        [gradedPersonInstance: gradedPersonInstance]
    }

    def edit(Long id) {
        def gradedPersonInstance = GradedPerson.get(id)
        if (!gradedPersonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gradedPerson.label', default: 'GradedPerson'), id])
            redirect(action: "list")
            return
        }

        [gradedPersonInstance: gradedPersonInstance]
    }

    def update(Long id, Long version) {
        def gradedPersonInstance = GradedPerson.get(id)
        if (!gradedPersonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gradedPerson.label', default: 'GradedPerson'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (gradedPersonInstance.version > version) {
                gradedPersonInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'gradedPerson.label', default: 'GradedPerson')] as Object[],
                          "Another user has updated this GradedPerson while you were editing")
                render(view: "edit", model: [gradedPersonInstance: gradedPersonInstance])
                return
            }
        }

        gradedPersonInstance.properties = params

        if (!gradedPersonInstance.save(flush: true)) {
            render(view: "edit", model: [gradedPersonInstance: gradedPersonInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'gradedPerson.label', default: 'GradedPerson'), gradedPersonInstance.id])
        redirect(action: "show", id: gradedPersonInstance.id)
    }

    def delete(Long id) {
        def gradedPersonInstance = GradedPerson.get(id)
        if (!gradedPersonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gradedPerson.label', default: 'GradedPerson'), id])
            redirect(action: "list")
            return
        }

        try {
            gradedPersonInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'gradedPerson.label', default: 'GradedPerson'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'gradedPerson.label', default: 'GradedPerson'), id])
            redirect(action: "show", id: id)
        }
    }
}
