package com.pulko.siurana.core

class Asistencia {
	
	static belongsTo = [usuario: Usuario, perfil: Perfil]
	
	Date fechaHora
	
    static constraints = {
		fechaHora nullable: true
    }
	
	@Override String toString() {
		return getFechaHora().format('dd/MM/yyyy - HH:mm') +" - "+ getPerfil()
	}
	
	def beforeInsert = { fechaHora = new Date() }
}
