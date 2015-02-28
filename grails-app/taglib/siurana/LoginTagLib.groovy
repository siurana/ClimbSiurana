package siurana

class LoginTagLib {
    static defaultEncodeAs = [taglib:'html']
    
	def loginControl = {
		if(session.usuario!=null){                    
			out << "<fieldset class='login'>"                        
                        out << "<div>"
			out << " ${session.user} "                        
                        out << """${link(action:"changePassword", controller:"user", alt: "Change Password", class: "image"){"<img src=${createLinkTo(dir: "images/taglib", file: "changePassword_2.png")} width='20px' />"}}"""                        
			out << """${link(action:"logout", controller:"authorize"){"<b>Logout</b>"}}"""
			out << "</div></fieldset>"                        
		}else{
                    
                    out << "<fieldset class='login'><div>"
                    out << "<a style='font-size:12px;' href=${url:createLinkTo(dir: "gadget", file: "RTI_Flyer.zip")} title=' Download \"AA.COM RTI Flyer v1.1\" gadget'>RTI Flyer v1.1&nbsp;&nbsp;<img src=${createLinkTo(dir: "images/taglib", file: "download_2.png")} width='20px' /></a>"
                    out << "<a style='font-size:12px;' href=${url:createLinkTo(dir: "gadget", file: "Release_Scheduler.zip")} title=' Download \"Release Scheduler v2.2.1\" gadget'>Release Scheduler v2.2.1&nbsp;&nbsp;<img src=${createLinkTo(dir: "images/taglib", file: "download_2.png")} width='20px' /></a>"
                    out << "</div></fieldset>"
                }
	}
}
