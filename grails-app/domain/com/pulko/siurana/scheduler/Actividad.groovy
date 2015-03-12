package com.pulko.siurana.scheduler

class Actividad {

	Date hora
	Double duracion
	static belongsTo = [espacio:Espacio, tipoActividad: TipoActividad]
	
    static constraints = {		
		hora blank: false
		duracion blank: false
    }
}
