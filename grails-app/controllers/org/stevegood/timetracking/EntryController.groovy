package org.stevegood.timetracking

import org.stevegood.util.Note

class EntryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [entryInstanceList: Entry.list(params), entryInstanceTotal: Entry.count()]
    }

    def create = {
        def entryInstance = new Entry()
        entryInstance.properties = params
		if (params?.projectID){
			entryInstance.project = Project.findByProjectID(params?.projectID)
		}
        return [entryInstance: entryInstance]
    }

    def save = {
        def entryInstance = new Entry(params)
        if (entryInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'entry.label', default: 'Entry'), entryInstance.id])}"
            redirect(action: "show", id: entryInstance.id)
        }
        else {
            render(view: "create", model: [entryInstance: entryInstance])
        }
    }

    def show = {
        def entryInstance = Entry.get(params.id)
        if (!entryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'entry.label', default: 'Entry'), params.id])}"
            redirect(action: "list")
        }
        else {
            [entryInstance: entryInstance]
        }
    }

    def edit = {
        def entryInstance = Entry.get(params.id)
        if (!entryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'entry.label', default: 'Entry'), params.id])}"
            redirect(controller:"project", action: "show", params:[projectID: entryInstance.project.projectID])
        }
        else {
            return [entryInstance: entryInstance]
        }
    }

    def update = {
        def entryInstance = Entry.get(params.id)
        if (entryInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (entryInstance.version > version) {
                    
                    entryInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'entry.label', default: 'Entry')] as Object[], "Another user has updated this Entry while you were editing")
                    render(view: "edit", model: [entryInstance: entryInstance])
                    return
                }
            }
            entryInstance.properties = params
            if (!entryInstance.hasErrors() && entryInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'entry.label', default: 'Entry'), entryInstance.id])}"
                redirect(action: "show", id: entryInstance.id)
            }
            else {
                render(view: "edit", model: [entryInstance: entryInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'entry.label', default: 'Entry'), params.id])}"
            redirect(controller:"project", action: "list")
        }
    }

    def delete = {
        def entryInstance = Entry.get(params.id)
        if (entryInstance) {
            try {
                entryInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'entry.label', default: 'Entry'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'entry.label', default: 'Entry'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'entry.label', default: 'Entry'), params.id])}"
            redirect(controller:"project", action: "show", params:[projectID: entryInstance.project.projectID])
        }
    }
	
	def addNote = {
		def entryInstance = Entry.get(params.id)
		def noteInstance = new Note()
		noteInstance.properties = params
		if (!entryInstance){
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'entry.label', default: 'Entry'), params.id])}"
			redirect(action:"list")
		}
		
		[entryInstance:entryInstance,noteInstance:noteInstance]
	}
	
	def saveNote = {
		def entryInstance = Entry.get(params.entryid)
		def noteInstance = new Note(params)
		entryInstance.addToNotes(noteInstance)
		
		if (noteInstance.save(flush: true)) {
			entryInstance.save(flush: true)
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'note.label', default: 'Note'), noteInstance.id])}"
			redirect(action: "show", id: entryInstance.id)
		}
		else {
			render(view: "create", model: [noteInstance: noteInstance,entryInstance:entryInstance])
		}
	}
	
	def showNote = {
		def noteInstance = Note.get(params.id)
		if (!noteInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'note.label', default: 'Note'), params.id])}"
			redirect(controller: "project", action: "list")
		}
		else {
			render(view:"/note/show", model: [noteInstance: noteInstance])
		}
	}
}
