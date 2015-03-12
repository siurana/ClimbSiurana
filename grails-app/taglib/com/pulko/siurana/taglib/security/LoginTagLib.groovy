package com.pulko.siurana.taglib.security

import grails.artefact.Artefact;

@Artefact("TagLibrary")
class LoginTagLib {
	static namespace = "pulko"
	static encodeAsForTags = [tagName: [taglib:'raw']]
	
	def loginControl = { attrs, body ->
		if(session.usuario){			
			out << "<div class='login'>"                        
            out << "<div>"
			out << " ${session.usuario} "                        
            out << """${link(action:"changePassword", controller:"user", alt: "Change Password", class: "image"){"<img src=${createLinkTo(dir: "images/taglib", file: "changePassword_2.png")} width='20px' />"}}"""                        
			out << """${link(action:"logout", controller:"authorize"){"<b>Logout</b>"}}"""
			out << "</div></div>"
		} else{
			out << "<div class='login'>"
			out << "<div>"
			out << """${link(action:"openSearch", controller:"asistencia"){"<b>Asistencia</b>"}}"""
			out << """${link(action:"login", controller:"authorize"){"<b>Login</b>"}}"""
			out << "</div></div>"
		} 		
		
	}
}
