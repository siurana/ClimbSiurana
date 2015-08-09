package com.pulko.siurana.fi

import com.pulko.siurana.core.Socio
import com.pulko.siurana.core.Usuario

class CobroPorDia {
	static belongsTo = [socio: Socio, responsable: Usuario]
	Socio socio
	Date fecha
	Double monto
	String descripcion
	
	static constraints = {
		fecha blank: false
		monto blank: false
		descripcion nullable: true
	}
	
	@Override String toString() {
		if(getFecha()==null){
			fecha=new Date()
		}
		return getFecha().format("dd/MM/YYYY")
	}
}

