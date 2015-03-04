package siurana

class LoginTagLib {
    static defaultEncodeAs = [taglib:'html']
    
	def loginControl = { attrs, body ->
		if(session.usuario!=null){                    
			out << "<fieldset class='login'>"                        
            out << "<div>"
			out << " ${session.usuario} "                        
            out << """${link(action:"changePassword", controller:"user", alt: "Change Password", class: "image"){"<img src=${createLinkTo(dir: "images/taglib", file: "changePassword_2.png")} width='20px' />"}}"""                        
			out << """${link(action:"logout", controller:"authorize"){"<b>Logout</b>"}}"""
			out << "</div></fieldset>"                        
		}
	}
}
