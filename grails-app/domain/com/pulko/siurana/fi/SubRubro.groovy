package com.pulko.siurana.fi

class SubRubro {
	
	static belongsTo = [rubro:Rubro]
	String Nombre
	String descripcion
	String tipo
	
    static constraints = {
		nombre blank: false, unique: true
		descripcion blank: false
		tipo blank: false, inList: ["Ingreso", "Egreso"]
	}
	
	@Override String toString() {
		return getNombre()
	}
	
}
