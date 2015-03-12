package com.pulko.siurana.scheduler

class DiaCalendario {
	String diaDeLaSemana
	String color
	static hasMany = [actividades:Actividad]
	
    static constraints = {
		diaDeLaSemana blank: false
		color blank: false
    }
}
