package com.pulko.siurana.core



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PerfilDeUsuarioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PerfilDeUsuario.list(params), model:[perfilDeUsuarioInstanceCount: PerfilDeUsuario.count()]
    }

    def show(PerfilDeUsuario perfilDeUsuarioInstance) {
        respond perfilDeUsuarioInstance
    }

    def create() {
        respond new PerfilDeUsuario(params)
    }

    @Transactional
    def save(PerfilDeUsuario perfilDeUsuarioInstance) {
        if (perfilDeUsuarioInstance == null) {
            notFound()
            return
        }

        if (perfilDeUsuarioInstance.hasErrors()) {
            respond perfilDeUsuarioInstance.errors, view:'create'
            return
        }

        perfilDeUsuarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'perfilDeUsuario.label', default: 'PerfilDeUsuario'), perfilDeUsuarioInstance.id])
                redirect perfilDeUsuarioInstance
            }
            '*' { respond perfilDeUsuarioInstance, [status: CREATED] }
        }
    }

    def edit(PerfilDeUsuario perfilDeUsuarioInstance) {
        respond perfilDeUsuarioInstance
    }

    @Transactional
    def update(PerfilDeUsuario perfilDeUsuarioInstance) {
        if (perfilDeUsuarioInstance == null) {
            notFound()
            return
        }

        if (perfilDeUsuarioInstance.hasErrors()) {
            respond perfilDeUsuarioInstance.errors, view:'edit'
            return
        }

        perfilDeUsuarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PerfilDeUsuario.label', default: 'PerfilDeUsuario'), perfilDeUsuarioInstance.id])
                redirect perfilDeUsuarioInstance
            }
            '*'{ respond perfilDeUsuarioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PerfilDeUsuario perfilDeUsuarioInstance) {

        if (perfilDeUsuarioInstance == null) {
            notFound()
            return
        }

        perfilDeUsuarioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PerfilDeUsuario.label', default: 'PerfilDeUsuario'), perfilDeUsuarioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'perfilDeUsuario.label', default: 'PerfilDeUsuario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
