package Jquery

class NewController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
       // redirect(action: "list", params: params)
         redirect(controller: "new", action: "tabs")
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [newInstanceList: New.list(params), newInstanceTotal: New.count()]
    }
    def form = {
        [new:New.list(params)]
    }
    def create = {
        def newInstance = new New()
        newInstance.properties = params
        return [newInstance: newInstance]
       
    }

    def save = {
        def newInstance = new New(params)
        if (newInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'new.label', default: 'New'), newInstance.id])}"
            redirect(action: "tabs", id: newInstance.id)
        }
        else {
            render(view: "create", model: [newInstance: newInstance])
        }
    }
 def tab_save = {
        def newInstance = new New(params)
        if (newInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'new.label', default: 'New'), newInstance.id])}"
           redirect(action: "tabs", id: newInstance.id)
        }
        else {
            render(view: "create", model: [newInstance: newInstance])
        }
    }
    def show = {
        def newInstance = New.get(params.id)
        if (!newInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'new.label', default: 'New'), params.id])}"
            redirect(action: "list")
        }
        else {
            [newInstance: newInstance]
        }
    }

    def edit = {
        def newInstance = New.get(params.id)
        if (!newInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'new.label', default: 'New'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [newInstance: newInstance]
        }
    }

    def update = {
        def newInstance = New.get(params.id)
        if (newInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (newInstance.version > version) {
                    
                    newInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'new.label', default: 'New')] as Object[], "Another user has updated this New while you were editing")
                    render(view: "edit", model: [newInstance: newInstance])
                    return
                }
            }
            newInstance.properties = params
            if (!newInstance.hasErrors() && newInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'new.label', default: 'New'), newInstance.id])}"
                redirect(action: "show", id: newInstance.id)
            }
            else {
                render(view: "edit", model: [newInstance: newInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'new.label', default: 'New'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def newInstance = New.get(params.id)
        if (newInstance) {
            try {
                newInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'new.label', default: 'New'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'new.label', default: 'New'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'new.label', default: 'New'), params.id])}"
            redirect(action: "list")
        }
    }
    def test = {
        
    }
       def tabs = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [newInstanceList: New.list(params), newInstanceTotal: New.count()]
    }
}
