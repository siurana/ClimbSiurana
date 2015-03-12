package com.pulko.siurana.scheduler

class Espacio {
	
	String nombre
	Integer capacidad
	String color
	static hasMany = [actividades:Actividad]
	
    static constraints = {
		nombre blank: false
		capacidad blank: false
		color blank: false
    }
}
