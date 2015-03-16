package com.pulko.siurana.core



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AsistenciaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def openSearch(){
		
	}
	
	def showUser(){		
		Usuario usuario=Usuario.findByNroDocumento(params.searchText)
		if(!usuario){
			request.withFormat {
				form multipartForm {
					flash.message = "No se encontro socio con DNI: "+ params.searchText
					redirect action: "openSearch", method: "GET"
				}
				'*'{ render status: NOT_FOUND }
			}
			return
		} else {
			def asistenciasDeHoy = [] as Set
			usuario.asistencias.each { 
				if(it.isToday()){
					asistenciasDeHoy << [perfil: it.getPerfil(),registrada: Boolean.TRUE]
				}
			}
			usuario.perfilesDeUsuario.each { 
				if(!asistenciasDeHoy.contains([perfil: it.getPerfil(),registrada: Boolean.TRUE])){
					asistenciasDeHoy << [perfil: it.getPerfil(),registrada: Boolean.FALSE]	
				}
			}
			respond usuario, model: [asistenciasDeHoy: asistenciasDeHoy]
		}
				
	}
	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Asistencia.list(params), model:[asistenciaInstanceCount: Asistencia.count()]
    }

    def show(Asistencia asistenciaInstance) {
        respond asistenciaInstance
    }

    def create() {
		Asistencia asistenciaInstance = new Asistencia(params)
		asistenciaInstance.fechaHora = new Date()		
        respond asistenciaInstance
    }

    @Transactional
    def save(Asistencia asistenciaInstance) {
        if (asistenciaInstance == null) {
            notFound()
            return
        }

		asistenciaInstance.fechaHora = new Date()
        if (asistenciaInstance.hasErrors()) {
            respond asistenciaInstance.errors, view:'create'
            return
        }

        asistenciaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'asistencia.label', default: 'Asistencia'), asistenciaInstance.id])
                redirect asistenciaInstance
            }
            '*' { respond asistenciaInstance, [status: CREATED] }
        }
    }

    def edit(Asistencia asistenciaInstance) {
        respond asistenciaInstance
    }

    @Transactional
    def update(Asistencia asistenciaInstance) {
        if (asistenciaInstance == null) {
            notFound()
            return
        }

        if (asistenciaInstance.hasErrors()) {
            respond asistenciaInstance.errors, view:'edit'
            return
        }

        asistenciaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Asistencia.label', default: 'Asistencia'), asistenciaInstance.id])
                redirect asistenciaInstance
            }
            '*'{ respond asistenciaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Asistencia asistenciaInstance) {

        if (asistenciaInstance == null) {
            notFound()
            return
        }

        asistenciaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Asistencia.label', default: 'Asistencia'), asistenciaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'asistencia.label', default: 'Asistencia'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
