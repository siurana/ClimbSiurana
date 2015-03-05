package com.pulko.siurana.core

class Usuario {

	static belongsTo = [rol: Rol]
	static fetchMode = [rol:"eager"]
	static hasMany = [perfilesDeUsuario: PerfilDeUsuario, asistencias: Asistencia]

	String userName
	String password
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

	static constraints = {
		userName blank: false, unique: true
		password blank: false, password: true
		nombre blank: false
		apellido blank: false
		nroDocumento blank: false, size: 8..10
		fechaDeNacimiento blank: false, nullable: true
		telefono blank: false
		email email:true, blank: false
		sexo blank: false, inList: ["M", "F"]
		fechaDeAlta blank: false, nullable: true
		fechaDeModificacion blank: false, nullable: true
		activo black: false
		deleted black: false
	}

	def isSuperUser(){
		return rol != null ? rol.getNombre() == "ROLE_ADMIN" : false
	}

	def beforeInsert = { fechaDeAlta = new Date() }

	def beforeUpdate = { fechaDeModificacion = new Date() }

	def perfiles() {
		return perfilesDeUsuario.collect{it.perfil}
	}
	
	@Override String toString() {
		return getApellido() +", "+ getNombre()
	}
}
