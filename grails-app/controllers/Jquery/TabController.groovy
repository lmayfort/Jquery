package Jquery
import grails.converters.JSON
class TabController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
       // redirect(controller: "new", action: "tabs", id: tabInstance.id))
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [tabInstanceList: Tab.list(params), tabInstanceTotal: Tab.count()]
    }

    def create = {
        def tabInstance = new Tab()
        tabInstance.properties = params
        return [tabInstance: tabInstance]
    }

    def save = {
        def tabInstance = new Tab(params)
        if (tabInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'tab.label', default: 'Tab'), tabInstance.id])}"
            //redirect(action: "show", id: tabInstance.id)
          
            redirect(controller: 'new', action:'tabs', id: tabInstance.id)
        }
        else {
            render(view: "create", model: [tabInstance: tabInstance])
        }
    }

    def show = {
        def tabInstance = Tab.get(params.id)
        if (!tabInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tab.label', default: 'Tab'), params.id])}"
            redirect(action: "list")
        }
        else {
            [tabInstance: tabInstance]
        }
    }

    def edit = {
        def tabInstance = Tab.get(params.id)
        if (!tabInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tab.label', default: 'Tab'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [tabInstance: tabInstance]
        }
    }

    def update = {
        def tabInstance = Tab.get(params.id)
        if (tabInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (tabInstance.version > version) {
                    
                    tabInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'tab.label', default: 'Tab')] as Object[], "Another user has updated this Tab while you were editing")
                    render(view: "edit", model: [tabInstance: tabInstance])
                    return
                }
            }
            tabInstance.properties = params
            if (!tabInstance.hasErrors() && tabInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'tab.label', default: 'Tab'), tabInstance.id])}"
                redirect(action: "show", id: tabInstance.id)
            }
            else {
                render(view: "edit", model: [tabInstance: tabInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tab.label', default: 'Tab'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def tabInstance = Tab.get(params.id)
        if (tabInstance) {
            try {
                tabInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'tab.label', default: 'Tab'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'tab.label', default: 'Tab'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tab.label', default: 'Tab'), params.id])}"
            redirect(action: "list")
        }
    }
   //    return JSON list of customers
   def jq_tab_list = {
    def tabs = Tab.list()
      def jsonCells = tabs.collect {
          [cell: [it.name,
                 it.city, it.id
               ], id: it.id]
        }
       def jsonData= [rows: jsonCells]
       render jsonData as JSON
 }
    def test_tabs ={
        
    }
      def tabs = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [tabInstanceList: Tab.list(params), tabInstanceTotal: Tab.count()]
    }
}
