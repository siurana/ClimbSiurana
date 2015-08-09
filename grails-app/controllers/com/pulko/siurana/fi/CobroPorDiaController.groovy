package com.pulko.siurana.fi



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CobroPorDiaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CobroPorDia.list(params), model:[cobroPorDiaInstanceCount: CobroPorDia.count()]
    }

    def show(CobroPorDia cobroPorDiaInstance) {
        respond cobroPorDiaInstance
    }

    def create() {
        respond new CobroPorDia(params)
    }

    @Transactional
    def save(CobroPorDia cobroPorDiaInstance) {
        if (cobroPorDiaInstance == null) {
            notFound()
            return
        }

        if (cobroPorDiaInstance.hasErrors()) {
            respond cobroPorDiaInstance.errors, view:'create'
            return
        }

        cobroPorDiaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cobroPorDia.label', default: 'CobroPorDia'), cobroPorDiaInstance.id])
                redirect cobroPorDiaInstance
            }
            '*' { respond cobroPorDiaInstance, [status: CREATED] }
        }
    }

    def edit(CobroPorDia cobroPorDiaInstance) {
        respond cobroPorDiaInstance
    }

    @Transactional
    def update(CobroPorDia cobroPorDiaInstance) {
        if (cobroPorDiaInstance == null) {
            notFound()
            return
        }

        if (cobroPorDiaInstance.hasErrors()) {
            respond cobroPorDiaInstance.errors, view:'edit'
            return
        }

        cobroPorDiaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CobroPorDia.label', default: 'CobroPorDia'), cobroPorDiaInstance.id])
                redirect cobroPorDiaInstance
            }
            '*'{ respond cobroPorDiaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CobroPorDia cobroPorDiaInstance) {

        if (cobroPorDiaInstance == null) {
            notFound()
            return
        }

        cobroPorDiaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CobroPorDia.label', default: 'CobroPorDia'), cobroPorDiaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cobroPorDia.label', default: 'CobroPorDia'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
