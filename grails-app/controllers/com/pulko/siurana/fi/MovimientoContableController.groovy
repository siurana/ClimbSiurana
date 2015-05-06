package com.pulko.siurana.fi



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MovimientoContableController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MovimientoContable.list(params), model:[movimientoContableInstanceCount: MovimientoContable.count()]
    }

    def show(MovimientoContable movimientoContableInstance) {
        respond movimientoContableInstance
    }

    def create() {
        respond new MovimientoContable(params)
    }

    @Transactional
    def save(MovimientoContable movimientoContableInstance) {
        if (movimientoContableInstance == null) {
            notFound()
            return
        }

        if (movimientoContableInstance.hasErrors()) {
            respond movimientoContableInstance.errors, view:'create'
            return
        }

        movimientoContableInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'movimientoContable.label', default: 'MovimientoContable'), movimientoContableInstance.id])
                redirect movimientoContableInstance
            }
            '*' { respond movimientoContableInstance, [status: CREATED] }
        }
    }

    def edit(MovimientoContable movimientoContableInstance) {
        respond movimientoContableInstance
    }

    @Transactional
    def update(MovimientoContable movimientoContableInstance) {
        if (movimientoContableInstance == null) {
            notFound()
            return
        }

        if (movimientoContableInstance.hasErrors()) {
            respond movimientoContableInstance.errors, view:'edit'
            return
        }

        movimientoContableInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MovimientoContable.label', default: 'MovimientoContable'), movimientoContableInstance.id])
                redirect movimientoContableInstance
            }
            '*'{ respond movimientoContableInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MovimientoContable movimientoContableInstance) {

        if (movimientoContableInstance == null) {
            notFound()
            return
        }

        movimientoContableInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MovimientoContable.label', default: 'MovimientoContable'), movimientoContableInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'movimientoContable.label', default: 'MovimientoContable'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
