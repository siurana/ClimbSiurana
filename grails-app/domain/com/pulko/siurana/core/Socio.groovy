package com.pulko.siurana.core

import java.util.Date;
import com.pulko.siurana.fi.Cobro
import grails.converters.JSON

class Socio {

    static hasMany = [modalidades: PerfilDeSocio, asistencias: Asistencia, cobros: Cobro]
	
	String nombre
	String apellido
	String dNI
	Date fechaDeNacimiento
	String domicilio
	String email
	String telefono
	String celular
	String sexo	
	Date fechaDeIngreso
	Date fechaDeAlta
	Date fechaDeModificacion
	Boolean activo = true
	Boolean esMenor = false
	Boolean deleted
	String observaciones
	
	// Datos Contacto de Emergencia
	String nombreContactoDeEmergencia
	String apellidoContactoDeEmergencia
	String telefonoContactoDeEmergencia
	String celularContactoDeEmergencia
	
	// Datos Padre
	String nombreDelPadre
	String apellidoDelPadre
	String dNIDelPadre
	String domicilioDelPadre
	String emailDelPadre
	String telefonoDelPadre
	String celularDelPadre

	// Datos Madre
	String nombreDeLaMadre
	String apellidoDeLaMadre
	String dNIDeLaMadre
	String domicilioDeLaMadre
	String emailDeLaMadre
	String telefonoDeLaMadre
	String celularDeLaMadre
	
	static constraints = {		
		nombre blank: false
		apellido blank: false
		dNI blank: true, nullable: true, size: 8..10
		fechaDeNacimiento blank: false, nullable: true, format: 'dd/MM/yyyy'
		domicilio blank: true, nullable: true, widget: 'textarea', maxSize: 200
		email email:true, blank: true, nullable: true		
		telefono blank: true, nullable: true
		celular blank: true, nullable: true
		
		sexo blank: false, inList: ["M", "F"]		
		esMenor blank: false
		
		// Datos Contacto de Emergencia
		nombreContactoDeEmergencia blank: true, nullable: true
		apellidoContactoDeEmergencia blank: true, nullable: true
		telefonoContactoDeEmergencia blank: true, nullable: true
		celularContactoDeEmergencia blank: true, nullable: true
		
		// Datos del Padre
		nombreDelPadre blank: true, nullable: true
		apellidoDelPadre blank: true, nullable: true
		dNIDelPadre blank: true, nullable: true, size: 8..10
		domicilioDelPadre blank: true, nullable: true, widget: 'textarea', maxSize: 200
		emailDelPadre email:true, blank: true, nullable: true
		telefonoDelPadre blank: true, nullable: true
		celularDelPadre blank: true, nullable: true
		
		// Datos de la Madre
		nombreDeLaMadre blank: true, nullable: true
		apellidoDeLaMadre blank: true, nullable: true
		dNIDeLaMadre blank: true, nullable: true, size: 8..10
		domicilioDeLaMadre blank: true, nullable: true, widget: 'textarea', maxSize: 200
		emailDeLaMadre email:true, blank: true, nullable: true
		telefonoDeLaMadre blank: true, nullable: true
		celularDeLaMadre blank: true, nullable: true
		
		fechaDeIngreso blank: true, nullable: true, format: 'dd/MM/yyyy'
		observaciones blank: true, nullable: true, widget: 'textarea', maxSize: 200
		
		activo blank: false
		fechaDeAlta blank: false, nullable: true, display: false, format: 'dd/MM/yyyy'
		fechaDeModificacion blank: false, nullable: true, display: false, format: 'dd/MM/yyyy'
		deleted blank: true, nullable: true, display: false
	}

	def isSuperUser(){
		return rol != null ? rol.getNombre() == "ROLE_ADMIN" : false
	}

	def beforeInsert = { 
		deleted = false
		fechaDeAlta = new Date() 
	}

	def beforeUpdate = { fechaDeModificacion = new Date() }

	def perfiles() {
		return modalidades.collect{it.perfil}
	}
	
	@Override String toString() {
		return getApellido() +", "+ getNombre()
	}
	
	def modalidadesAsJson(){
		def converter = modalidades.perfil.collect{[id: it.id, arancel:it.arancel, descripcion: it.descripcion]} as JSON;
		return converter
	}
	
}
