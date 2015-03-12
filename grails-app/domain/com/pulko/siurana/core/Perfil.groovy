package com.pulko.siurana.core

class Perfil {
	String nombre	
	String descripcion
	double arancel
	Boolean esLibre
	Integer nroDeClases  
	static hasMany = [perfilesDeUsuario: PerfilDeUsuario, asistencia: Asistencia]
	
	static constraints = {
		nombre blank: false, unique: true
		descripcion blank: false, maxSize: 50
		arancel blank: true
		esLibre blank: false
		nroDeClases nullable:true, inList: [4, 8, 12, 16]
	}
   
	@Override String toString() {
		return getDescripcion()
	}

	def usuarios() {
		return perfilesDeUsuario.collect{it.usuario}
	}
}
