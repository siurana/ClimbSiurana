package com.pulko.siurana.core

class Asistencia {
	
	static belongsTo = [socio: Socio, perfil: Perfil]
	
	Date fechaHora
	
    static constraints = {
		fechaHora nullable: true, format: 'dd/MM/yyyy - HH:mm'
    }
	
	@Override String toString() {
		return getFechaHora().format('dd/MM/yyyy - HH:mm') +" - "+ getPerfil()
	}
	
	public Boolean isToday(){		
		getFechaHora().clearTime()==(new Date()).clearTime()
	} 	

}
