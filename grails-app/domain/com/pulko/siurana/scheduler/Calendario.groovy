package com.pulko.siurana.scheduler

class Calendario {
	
	static hasMany = [diasCalendario:DiaCalendario]
	String nombre
	String descripcion
	
    static constraints = {
		nombre blank: false, unique: true
		descripcion blank: false, maxSize: 250
    }
	
	@Override String toString() {
		return getNombre()
	}
}
