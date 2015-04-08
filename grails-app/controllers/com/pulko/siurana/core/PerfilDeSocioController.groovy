package com.pulko.siurana.core



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PerfilDeSocioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PerfilDeSocio.list(params), model:[perfilDeSocioInstanceCount: PerfilDeSocio.count()]
    }

    def show(PerfilDeSocio perfilDeSocioInstance) {
        respond perfilDeSocioInstance
    }

    def create() {
        respond new PerfilDeSocio(params)
    }

    @Transactional
    def save(PerfilDeSocio perfilDeSocioInstance) {
        if (perfilDeSocioInstance == null) {
            notFound()
            return
        }

        if (perfilDeSocioInstance.hasErrors()) {
            respond perfilDeSocioInstance.errors, view:'create'
            return
        }

        perfilDeSocioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'perfilDeSocio.label', default: 'PerfilDeSocio'), perfilDeSocioInstance.id])
                redirect perfilDeSocioInstance
            }
            '*' { respond perfilDeSocioInstance, [status: CREATED] }
        }
    }

    def edit(PerfilDeSocio perfilDeSocioInstance) {
        respond perfilDeSocioInstance
    }

    @Transactional
    def update(PerfilDeSocio perfilDeSocioInstance) {
        if (perfilDeSocioInstance == null) {
            notFound()
            return
        }

        if (perfilDeSocioInstance.hasErrors()) {
            respond perfilDeSocioInstance.errors, view:'edit'
            return
        }

        perfilDeSocioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PerfilDeSocio.label', default: 'PerfilDeSocio'), perfilDeSocioInstance.id])
                redirect perfilDeSocioInstance
            }
            '*'{ respond perfilDeSocioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PerfilDeSocio perfilDeSocioInstance) {

        if (perfilDeSocioInstance == null) {
            notFound()
            return
        }

        perfilDeSocioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PerfilDeSocio.label', default: 'PerfilDeSocio'), perfilDeSocioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'perfilDeSocio.label', default: 'PerfilDeSocio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
