

class SecutityFilters {

	def filters = {
		all(controller:'*', action:'*') {
			before = {
				if(!'searchUser'.equals(actionName) && !'openSearch'.equals(actionName)  && !'showSocio'.equals(actionName) && !'guardarAsistencia'.equals(actionName)){
					if (!session.usuario && !actionName.equals('login')) {
						redirect(controller:"authorize",action: 'login')
					}
				}
			}
			after = { Map model ->
			}
			afterView = { Exception e ->
			}
		}
	}
}
