package com.pulko.siurana.core

import java.util.Date;

class Socio {

    static hasMany = [perfilesDeSocio: PerfilDeSocio, asistencias: Asistencia]
	
	String nombre
	String apellido
	String email
	String telefono
	Date fechaDeNacimiento
	String nroDocumento
	String sexo
	Date fechaDeAlta
	Date fechaDeModificacion
	Boolean activo
	Boolean deleted
	String comentarios

	static constraints = {		
		nombre blank: false
		apellido blank: false
		nroDocumento blank: false, size: 8..10
		fechaDeNacimiento blank: false, nullable: true, format: 'dd/MM/yyyy'
		telefono blank: true, nullable: true
		email email:true, blank: true, nullable: true
		sexo blank: false, inList: ["M", "F"]
		fechaDeAlta blank: false, nullable: true, display: false, format: 'dd/MM/yyyy'
		fechaDeModificacion blank: false, nullable: true, display: false, format: 'dd/MM/yyyy'
		activo black: false
		deleted black: true, nullable: true, display: false
		comentarios blank: true, nullable: true, widget: 'textarea', range: 0..600
	}

	def isSuperUser(){
		return rol != null ? rol.getNombre() == "ROLE_ADMIN" : false
	}

	def beforeInsert = { 
		deleted = false
		fechaDeAlta = new Date() 
	}

	def beforeUpdate = { fechaDeModificacion = new Date() }

	def perfiles() {
		return perfilesDeSocio.collect{it.perfil}
	}
	
	@Override String toString() {
		return getApellido() +", "+ getNombre()
	}
	
}
