package com.pulko.siurana.fi
import grails.converters.JSON

class Rubro {
	
	static hasMany = [subRubros:SubRubro]
	String nombre
	String descripcion
	
    static constraints = {
		nombre blank: false, unique: true
		descripcion blank: false
    }
	
	@Override String toString() {
		return getNombre()
	}
	
	def subRubrosAsJson(){
		def converter = subRubros.collect{[id: it.id, nombre: it.nombre]} as JSON;
		return converter
	}
}
