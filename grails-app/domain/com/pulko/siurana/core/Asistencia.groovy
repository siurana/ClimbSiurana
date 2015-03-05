package com.pulko.siurana.core

class Asistencia {
	static belongsTo [usuario: Usuario]
	Date fechaHora
	
    static constraints = {
		fechaHora
    }
}
