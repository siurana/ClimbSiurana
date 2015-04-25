package com.pulko.siurana.core

import com.pulko.siurana.fi.Cobro

class Perfil {
	String nombre	
	String descripcion
	double arancel

	static hasMany = [perfilesDeSocios: PerfilDeSocio, asistencias: Asistencia, cobros: Cobro]
	
	static constraints = {
		nombre blank: false, unique: true
		descripcion blank: false, maxSize: 50
		arancel blank: true		
	}
   
	@Override String toString() {
		return getDescripcion()
	}

}
