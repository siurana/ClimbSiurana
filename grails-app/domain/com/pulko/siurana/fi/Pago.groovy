package com.pulko.siurana.fi
import com.pulko.siurana.core.Usuario;

class Pago {
	
	static belongsTo = [socio: Usuario, responsable: Usuario]
	Date fechaHora
	Double monto
	String descripcion
	
    static constraints = {
		fechaHora blank: false
		monto blank: false
		descripcion nullable: true
    }
}
