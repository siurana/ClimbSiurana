package com.pulko.siurana.scheduler

class TipoActividad {

	String nombre
	String descripcion
	String color
	static hasMany = [actividades:Actividad]

	static constraints = {
		nombre blank: false
		descripcion blank: false
		color blank: false
	}
}
