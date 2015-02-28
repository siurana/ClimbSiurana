package siurana

class AuthorizeController {

     def index() {[]}
	 
    
    def login = {    
        if (session.usuario) {
            redirect(uri:"/")                    
        }
    }
  
    def authenticate = {
//        def user = User.findByUserNameAndPassword(params.userName, params.password)
//        if(user){
//            session.usuario = user                  
//            session.user.role = user.role                  
//        }else{
//            flash.message = "Sorry, ${params.userName}. Try againt."     
//        }
    }
  
    def logout = {
        flash.message = "Bye bye ${session.user} !!"
        session.usuario = null        
        redirect(action: "login")
    }  
}
