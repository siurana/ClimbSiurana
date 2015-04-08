package com.pulko.siurana.core

class Perfil {
	String nombre	
	String descripcion
	double arancel

	static hasMany = [perfilesDeSocios: PerfilDeSocio, asistencias: Asistencia]
	
	static constraints = {
		nombre blank: false, unique: true
		descripcion blank: false, maxSize: 50
		arancel blank: true		
	}
   
	@Override String toString() {
		return getDescripcion()
	}

}
