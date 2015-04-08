package com.pulko.siurana.fi
import com.pulko.siurana.core.PerfilDeSocio;
import com.pulko.siurana.core.Usuario;

class Cobro {
	
	static belongsTo = [perfilDeSocio: PerfilDeSocio, responsable: Usuario]
	Date fechaHora
	Double monto
	String descripcion
	
    static constraints = {
		fechaHora blank: false
		monto blank: false
		descripcion nullable: true
    }
}
