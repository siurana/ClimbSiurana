package com.pulko.siurana.core

class Asistencia {
	
	static belongsTo = [usuario: Usuario, perfil: Perfil]
	
	Date fechaHora
	
    static constraints = {
		fechaHora nullable: true, format: 'dd/MM/yyyy - HH:mm'
    }
	
	@Override String toString() {
		return getFechaHora().format('dd/MM/yyyy - HH:mm') +" - "+ getPerfil()
	}
	
	def beforeInsert = { fechaHora = new Date() }
	
	public Boolean isToday(){		
		getFechaHora().clearTime()==(new Date()).clearTime()
	} 	

}
