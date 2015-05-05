package com.pulko.siurana.fi

class Rubro {
	
	static hasMany = [subRubros:SubRubro]
	String Nombre
	String descripcion
	
    static constraints = {
		nombre blank: false, unique: true
		descripcion blank: false
    }
	
	@Override String toString() {
		return getNombre()
	}
	
}
