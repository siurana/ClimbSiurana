package com.pulko.siurana.core

import com.pulko.siurana.fi.Cobro
import groovy.time.TimeCategory
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AsistenciaController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def openSearch(){
	}

	def showSocio(){
		Socio socio=Socio.findByDNI(params.searchText)
		if(!socio){
			request.withFormat {
				form multipartForm {
					flash.message = "No se encontro socio con DNI: "+ params.searchText
					redirect action: "openSearch", method: "POST"
				}
				'*'{ render status: NOT_FOUND }
			}
			return
		} else {
			def asistenciasDeHoy = [] as Set
			boolean tieneAlgunaAsistenciaParaRegistrarElDiaDeHoy=false

			if(socio.modalidades.size()==0){
				request.withFormat {
					form multipartForm {
						flash.message = "El socio ${socio} no tiene perfieles cargados"
						redirect action: "openSearch", method: "POST"
					}
					'*'{ render status: NOT_FOUND }
				}
				return
			}

			if(Asistencia.count()>0){
				socio.asistencias.each {
					if(it.isToday()){
						asistenciasDeHoy << [perfil: it.getPerfil(), idSocio: socio.id, registrada: Boolean.TRUE]
					}
				}
			}
			socio.modalidades.each {
				if(!asistenciasDeHoy.contains([perfil: it.getPerfil(), idSocio: socio.id, registrada: Boolean.TRUE])){
					asistenciasDeHoy << [perfil: it.getPerfil(), idSocio: socio.id, registrada: Boolean.FALSE]
					tieneAlgunaAsistenciaParaRegistrarElDiaDeHoy = true
				}
			}

			if(!tieneAlgunaAsistenciaParaRegistrarElDiaDeHoy){
				request.withFormat {
					form multipartForm {
						flash.message = "El socio ${socio} ya ha registrado su/s asistencia/s para hoy"
						redirect action: "openSearch", method: "POST"
					}
					'*'{ render status: NOT_FOUND }
				}
				return
			} else{
				flash.message = ""
				if(asistenciasDeHoy.size()==1){
					request.withFormat {
						form multipartForm {
							redirect action: "guardarAsistencia", method: "POST", params:[idSocio:socio.id, idPerfil: asistenciasDeHoy[0].perfil.id]
						}
						'*'{ render status: OK }
					}
				} else {

					respond socio, model: [asistenciasDeHoy: asistenciasDeHoy]
				}
			}
		}
	}

	@Transactional
	def guardarAsistencia(){
		Socio socioInstance = Socio.get(params.idSocio)
		Perfil perfilInstance = Perfil.get( params.idPerfil)
		Asistencia asistenciaInstance=new Asistencia(fechaHora: new Date(), socio:socioInstance, perfil:perfilInstance)
		asistenciaInstance.save flush:true

		flash.message = "La asistencia fue registrata con exito!!"

		int asistenciasDelMes = 0
		def hoy = new Date()
		def fromDate = hoy - 1
		def toDate

		use(TimeCategory) {
			toDate = hoy + 1.month
		}

		if(Asistencia.count()>0){
			socioInstance.asistencias.each {
				if((it.fechaHora > fromDate) && (it.fechaHora < toDate) && (it.perfil.id==perfilInstance.id)){
					asistenciasDelMes++
				}
			}
		} else {
			asistenciasDelMes++
		}

		def lastCobro = socioInstance.whenWasTheLastPayment()

		flash.asistenciasDelMes=asistenciasDelMes
		flash.asistenciaInstance=asistenciaInstance


		redirect  action: "openSearch", method: "POST"
	}

	def index(Integer max) {
		def query = Asistencia.where{1==1} 

		if(params.fecha_mes || params.fecha_dia){
			String nombre =	params.nombre
			if(!params.nombre){
				params.nombre = "-"
			}
			String apellido = params.apellido
			if(!params.apellido){
				params.apellido = "-"
			}
			
			if(params.filterDate=="filterMonth"){
				if(params.nombre == "-" && params.apellido == "-"){
					query = Asistencia.where {
						month(fechaHora)==params.fecha_mes_month && year(fechaHora)==params.fecha_mes_year
					}
				} else {
					query = Asistencia.where {
						(month(fechaHora)==params.fecha_mes_month && year(fechaHora)==params.fecha_mes_year && (socio.nombre =~ "%${params.nombre}%" || socio.apellido =~ "%${params.apellido}%"))
					}
				}
			} else {
				if(params.nombre == "-" && params.apellido == "-"){
					query = Asistencia.where {
						day(fechaHora)==params.fecha_dia_day && month(fechaHora)==params.fecha_dia_month && year(fechaHora)==params.fecha_dia_year
					}
				} else {
					query = Asistencia.where {
						(day(fechaHora)==params.fecha_dia_day && month(fechaHora)==params.fecha_dia_month && year(fechaHora)==params.fecha_dia_year && (socio.nombre =~ "%${params.nombre}%" || socio.apellido =~ "%${params.apellido}%"))
					}
				}
			}

			params.sort= "fechaHora"
			params.order= "asc"
			def lista = query.list(params)
			params.nombre = nombre
			params.apellido = apellido
			respond lista, [nombre: nombre, apellido: apellido, fecha: params.fecha]
		}
	}

	def show(Asistencia asistenciaInstance) {
		respond asistenciaInstance
	}

	def create() {
		Asistencia asistenciaInstance = new Asistencia(params)
		asistenciaInstance.fechaHora = new Date()
		respond asistenciaInstance
	}

	def createFromSocio() {
		Asistencia asistenciaInstance = new Asistencia(params)
		asistenciaInstance.fechaHora = new Date()
		respond asistenciaInstance
	}

	@Transactional
	def saveFromSocio(Asistencia asistenciaInstance) {
		if (asistenciaInstance == null) {
			notFound()
			return
		}


		if (asistenciaInstance.hasErrors()) {
			respond asistenciaInstance.errors, view:'create'
			return
		}
		
		if (checkAsistenciaForToday(asistenciaInstance)) {
			respond asistenciaInstance.errors, view:'create'
			return
		}

		asistenciaInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [message(code: 'asistencia.label', default: 'Asistencia'), asistenciaInstance.socio.id])
				redirect action:"show", controller:"socio", id:asistenciaInstance.socio.id, method:"POST"
			}
			'*' { respond asistenciaInstance, [status: CREATED] }
		}
	}

	def checkAsistenciaForToday(Asistencia asistenciaInstance){
		def asistencia = Asistencia.findByFechaHoraAndSocioAndPerfil(asistenciaInstance.getFechaHora(), asistenciaInstance.getSocio(), asistenciaInstance.getPerfil())
		if(asistencia){
			asistenciaInstance.errors.reject("La asistencia yad ha sido tomada hoy dia ")
		}
		return asistencia
	}

	@Transactional
	def save(Asistencia asistenciaInstance) {
		if (asistenciaInstance == null) {
			notFound()
			return
		}


		if (asistenciaInstance.hasErrors()) {
			respond asistenciaInstance.errors, view:'create'
			return
		}

		if (checkAsistenciaForToday(asistenciaInstance)) {			
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
