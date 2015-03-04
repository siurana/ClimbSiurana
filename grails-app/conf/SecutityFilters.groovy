

class SecutityFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
				if(actionName==null || (actionName.indexOf('aaStatusWS')==-1 && actionName.indexOf('releaseScheduler')==-1)){
					if (!session.user && !actionName.equals('login')) {
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
