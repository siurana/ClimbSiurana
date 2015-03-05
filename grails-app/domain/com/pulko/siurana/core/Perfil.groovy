package com.pulko.siurana.core

class Perfil {
	String nombre
	double arancel
	String descripcion
	static hasMany = [perfilesDeUsuario: PerfilDeUsuario]
	
	static constraints = {
		nombre blank: false, unique: true
		arancel blank: true
		descripcion blank: false, maxSize: 50
	}
   
	@Override String toString() {
		return getDescripcion()
	}

	def usuarios() {
		return perfilesDeUsuario.collect{it.usuario}
	}
}
