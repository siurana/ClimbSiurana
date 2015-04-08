package com.pulko.siurana.core

class Usuario {

	static belongsTo = [rol: Rol, socio: Socio]
	static fetchMode = [rol:"eager"]

	String userName
	String password
	String nombre
	String apellido
	Date fechaDeAlta
	Date fechaDeModificacion	
	Boolean deleted

	static constraints = {
		userName blank: false, unique: true
		password blank: false, password: true
		nombre blank: false
		apellido blank: false
		fechaDeAlta blank: false, nullable: true, display: false, format: 'dd/MM/yyyy'
		fechaDeModificacion blank: false, nullable: true, display: false, format: 'dd/MM/yyyy'
		deleted black: false, display: false
		socio blank: true, nullable: true
	}

	def isSuperUser(){
		return rol != null ? rol.getNombre() == "ROLE_ADMIN" : false
	}
	
	def hasSocio(){
		return socio != null
	}

	def beforeInsert = { 
		deleted = false
		fechaDeAlta = new Date() 
	}

	def beforeUpdate = { fechaDeModificacion = new Date() }
		
	@Override String toString() {
		return getApellido() +", "+ getNombre()
	}
	
}
