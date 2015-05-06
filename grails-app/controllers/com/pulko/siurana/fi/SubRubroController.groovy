package com.pulko.siurana.fi



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SubRubroController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SubRubro.list(params), model:[subRubroInstanceCount: SubRubro.count()]
    }

    def show(SubRubro subRubroInstance) {
        respond subRubroInstance
    }

	def addSubRubro() {
		respond new SubRubro(params)
	}
	
    def create() {
        respond new SubRubro(params)
    }

    @Transactional
    def save(SubRubro subRubroInstance) {
        if (subRubroInstance == null) {
            notFound()
            return
        }

        if (subRubroInstance.hasErrors()) {
            respond subRubroInstance.errors, view:'addSubRubro'
            return
        }

        subRubroInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'subRubro.label', default: 'SubRubro'), subRubroInstance.id])
                redirect subRubroInstance
            }
            '*' { respond subRubroInstance, [status: CREATED] }
        }
    }
	
	@Transactional
	def saveSubRubro(SubRubro subRubroInstance) {
		if (subRubroInstance == null) {
			notFound()
			return
		}

		if (subRubroInstance.hasErrors()) {
			respond subRubroInstance.errors, view:'create'
			return
		}

		subRubroInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [message(code: 'subRubro.label', default: 'SubRubro'), subRubroInstance.nombre])
				redirect subRubroInstance.rubro
			}
			'*' { respond subRubroInstance.rubro, [status: CREATED] }
		}
	}

    def edit(SubRubro subRubroInstance) {
        respond subRubroInstance
    }

    @Transactional
    def update(SubRubro subRubroInstance) {
        if (subRubroInstance == null) {
            notFound()
            return
        }

        if (subRubroInstance.hasErrors()) {
            respond subRubroInstance.errors, view:'edit'
            return
        }

        subRubroInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SubRubro.label', default: 'SubRubro'), subRubroInstance.id])
                redirect subRubroInstance
            }
            '*'{ respond subRubroInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(SubRubro subRubroInstance) {

        if (subRubroInstance == null) {
            notFound()
            return
        }

        subRubroInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SubRubro.label', default: 'SubRubro'), subRubroInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'subRubro.label', default: 'SubRubro'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
