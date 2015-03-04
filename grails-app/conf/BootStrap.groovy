import siurana.Rol
import siurana.Usuario

class BootStrap {

	def init = { servletContext -> initRolesAndUsers() }
	def destroy = {
	}

	def initRolesAndUsers() {

		def role_admin = Rol.findByNombre('ROLE_SUPER_USER')
		if (!role_admin) {
			role_admin = new Rol(nombre: 'ROLE_SUPER_USER', descripcion: 'Super User')
			role_admin.save(flush: true)
		}

		def role_general = Rol.findByNombre('ROLE_GENERAL_USER')
		if (!role_general) {
			role_general = new Rol(nombre: 'ROLE_GENERAL_USER', descripcion: 'General User')
			role_general.save(flush: true)
		}

		def pablo = Usuario.findByUserName('ptissera')
		if (!pablo) {
			pablo = new Usuario(userName: 'ptissera', nombre: 'Pablo', apellido: 'Tissera', password: '123', telefono: '234234324',
			activo: true, sexo: "M", fechaDeNacimiento: new Date(), email: 'pablo.tissera@hp.com', deleted: false)
			pablo.setRol(role_admin)
			pablo.save(flush: true)
		}
	}
}
