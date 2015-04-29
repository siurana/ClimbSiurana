package com.pulko.siurana.tool

import grails.artefact.Artefact

@Artefact("TagLibrary")
class RegistrarAsistenciaTagLib {
	static namespace = "pulko"
	static encodeAsForTags = [tagName: [taglib:'raw']]

	def registrarAsistencia = { attrs ->
		String perfil = attrs.remove('perfil')
		String idPerfil = attrs.remove('idPerfil')
		String idSocio = attrs.remove('idSocio')
		Boolean isRegistrada = attrs.remove('isRegistrada')
		
		if(!isRegistrada){
			def backgroundImage="style='background-image: url(${createLinkTo(dir: "images", file: "hand.png")}); '"
			def bodyButton = "<div ${backgroundImage}><b>${perfil}</b></div>"
			out << """${link(class: "mainOptionAsistencia", action: "guardarAsistencia", controller: "asistencia", params: [idSocio:idSocio,idPerfil:idPerfil]){bodyButton}}"""
		}   else {
			def backgroundImage="style='background-image: url(${createLinkTo(dir: "images", file: "ready.png")}); '"
			def bodyButton = "<div class='mainOptionAsistenciaReady'><div ${backgroundImage}><b>${perfil}</b></div></div>"
			out << bodyButton
		}
	}
}
