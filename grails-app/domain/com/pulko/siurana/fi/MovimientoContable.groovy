package com.pulko.siurana.fi

import com.pulko.siurana.core.Usuario

class MovimientoContable {
	
	static belongsTo = [subRubro: SubRubro, responsable: Usuario]
	Date fechaHora
	Double monto
	String detalle
	
    static constraints = {
		fechaHora blank: false
		monto blank: false
		detalle nullable: true
    }
	
}
