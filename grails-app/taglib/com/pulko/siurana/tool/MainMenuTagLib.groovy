package com.pulko.siurana.tool
import grails.artefact.Artefact;

@Artefact("TagLibrary")
class MainMenuTagLib {
	static namespace = "pulko"
	static encodeAsForTags = [tagName: [taglib:'raw']]
	
	def subMenuContent = []
	def subMenuContentAux = ""
	
	def menu = { attrs, body ->
		if(session.usuario){
			buildingMenu()
		}
	}
	
	def buildingMenu(){
		startMenu()
		startMainMenu()
		buildingItemMenu([tittle: "Inicio", url: "/"])
		buildingItemMenu([tittle: "Administracion", submenu: [[
			[tittle: "Usuarios", action: "index", controller:"usuario"],
			[tittle: "Socios", action: "index", controller:"socio"],
			[tittle: "Perfiles", action: "index", controller:"perfil"]
			],[
			[tittle: "Roles", action: "index", controller:"rol"],
			[tittle: "Asistencias", action: "index", controller:"asistencia"],
			[tittle: "Perfil de socio", action: "index", controller:"perfilDeSocio"]
			]]])
		buildingItemMenu([tittle: "Cobros", action: "index", controller:"cobro"])
		buildingItemMenu([tittle: "Reportes", submenu: [[
			[tittle: "Cobros por mes", action: "index", controller:"reporteCobrosPorMes"],
			[tittle: "Listado de socios morosos", action: "sociosMorosos", controller:"reportes"],
			[tittle: "Resumen Socios", action: "resulmenSocios", controller:"reportes"]
			]]])
		buildingItemMenu([tittle: "Herramientas", submenu: [[
			[tittle: "Carga masiva", action: "upload", controller:"cargarDeSociosDesdeExcel"],
			[tittle: "Carga masiva menores", action: "upload", controller:"cargarDeSociosMenoresDesdeExcel"]
			]]])
		endMainMenu()
		subMenuContent.each { submenucontent ->
			out << submenucontent
		}
		endMenu()
	}

	def startMenu() {
		out << "<nav>"
	}
	def startMainMenu() {
		out << "<ul>"
	}
	
	def endMainMenu() {
		out << "</ul>"
	}
	
	def endMenu() {
		out << "</nav>"
	}
	
	def startSubMenu() {
		def idSubMenu = subMenuContent.size()
		return "<div id='submenu_${idSubMenu}'>"
	}
	
	def endSubMenu() {
		return "</div>"
	}
	
	def buildingItemMenu(item){
		out << "<li>"
		if(!item.submenu){
			if(!item.url){
				out << """${link(action:item.action, controller:item.controller){item.tittle}}"""
			} else{
				out << """${link(url: createLink(uri: item.url)){item.tittle}}"""
			}
		}else{
			def idSubMenu = subMenuContent.size()
			out << "<span name='submenu_${idSubMenu}'>${item.tittle}</span>"
			buildingSubMenu(item.submenu)
		}
		out << "</li>"
	}
	
	def buildingSubMenu(submenusrow){
		subMenuContentAux = startSubMenu()
		submenusrow.each {submenus ->
			buildingSubMenuRow(submenus)
		}
		subMenuContentAux += endSubMenu()
		subMenuContent << subMenuContentAux
	}
	
	def buildingSubMenuRow(submenus){
		subMenuContentAux += "<ul>"
		submenus.each { submenu ->
			subMenuContentAux += "<li>"
			if(!submenu.url){
				subMenuContentAux += """${link(action:submenu.action, controller:submenu.controller){submenu.tittle}}"""
			} else{
				subMenuContentAux += """${link(url: createLink(uri: item.url)){submenu.tittle}}"""
			}
			subMenuContentAux += "</li>"
		}
		subMenuContentAux += "</ul>"
	}
}
