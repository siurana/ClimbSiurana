package com.pulko.siurana.fi

import com.pulko.siurana.core.Socio
import com.pulko.siurana.core.Perfil
import com.pulko.siurana.core.Usuario

class Cobro {
	
	static belongsTo = [socio: Socio, perfil: Perfil, responsable: Usuario]
	Date fechaHora
	Double monto
	String descripcion
	
    static constraints = {
		fechaHora blank: false
		monto blank: false
		descripcion nullable: true
    }
	
}
