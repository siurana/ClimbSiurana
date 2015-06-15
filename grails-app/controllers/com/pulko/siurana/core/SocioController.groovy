package com.pulko.siurana.core



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SocioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
		
		def query
		String nombre =	params.nombre
		String apellido = params.apellido
		
				if(!params.nombre && !params.apellido){
					if(params.soloLosActivos!=null && params.soloLosActivos=='true'){
						query = Socio.where {
							activo==true
						}
					} else {
						query = Socio.where {
						}
					}
				} else {
					
					if(!params.nombre){
						params.nombre = "-"
					}
					
					if(!params.apellido){
						params.apellido = "-"
					}
					query = Socio.where {
						(nombre =~ "%${params.nombre}%" || apellido =~ "%${params.apellido}%") && activo==params.soloLosActivos
					}
				} 
						
			params.sort= "apellido"
			params.order= "asc"			
			def lista = query.list(params)
			params.nombre = nombre
			params.apellido = apellido
			respond lista, [nombre: nombre, apellido: apellido]
    }

    def show(Socio socioInstance) {
        respond socioInstance
    }

    def create() {
        respond new Socio(params)
    }
	
	def createPerfilDeSocio() {        		
		respond new PerfilDeSocio(params)
	}

    @Transactional
    def save(Socio socioInstance) {
        if (socioInstance == null) {
            notFound()
            return
        }

        if (socioInstance.hasErrors()) {
            respond socioInstance.errors, view:'create'
            return
        }

        socioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'socio.label', default: 'Socio'), socioInstance.id])
                redirect socioInstance
            }
            '*' { respond socioInstance, [status: CREATED] }
        }
    }
	
	@Transactional
	def savePerfilDeSocio(PerfilDeSocio perfilDeSocioInstance) {
		if (perfilDeSocioInstance == null) {
			notFound()
			return
		}

		if (perfilDeSocioInstance.hasErrors()) {
			respond perfilDeSocioInstance.errors, view:'createPerfilDeSocio'
			return
		}

		perfilDeSocioInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [message(code: 'perfilDeSocio.label', default: 'PerfilDeSocio'), perfilDeSocioInstance.socio.id])
				redirect perfilDeSocioInstance.socio
			}
			'*' { respond perfilDeSocioInstance, [status: CREATED] }
		}
	}


    def edit(Socio socioInstance) {
        respond socioInstance
    }

    @Transactional
    def update(Socio socioInstance) {
        if (socioInstance == null) {
            notFound()
            return
        }

        if (socioInstance.hasErrors()) {
            respond socioInstance.errors, view:'edit'
            return
        }

        socioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Socio.label', default: 'Socio'), socioInstance.id])
                redirect socioInstance
            }
            '*'{ respond socioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Socio socioInstance) {

        if (socioInstance == null) {
            notFound()
            return
        }

        socioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Socio.label', default: 'Socio'), socioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
	
	@Transactional
	def removeModalidad(PerfilDeSocio perfilDeSocioInstance) {

		if (perfilDeSocioInstance == null) {
			notFound()
			return
		}
		
		def idSocio = perfilDeSocioInstance.socio.id

		perfilDeSocioInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [message(code: 'PerfilDeSocio.label', default: 'Modalidad'), idSocio])
				redirect action:"show", method:"POST"
			}
			'*'{ render status: NO_CONTENT }
		}
	}
	

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'socio.label', default: 'Socio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
