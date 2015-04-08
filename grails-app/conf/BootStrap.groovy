import com.pulko.siurana.core.Perfil
import com.pulko.siurana.core.Rol
import com.pulko.siurana.core.Usuario

class BootStrap {

	def init = { servletContext ->
		initRolesAndUsers()
		initPerfiles()
	}

		def destroy = {
	}

	def initRolesAndUsers() {

		def role_super = Rol.findByNombre('ROLE_SUPER_USER')
		if (!role_super) {
			role_super = new Rol(nombre: 'ROLE_SUPER_USER', descripcion: 'Super User')
			role_super.save(flush: true)
		}

		def role_admin = Rol.findByNombre('ROLE_ADMIN_USER')
		if (!role_admin) {
			role_admin = new Rol(nombre: 'ROLE_ADMIN_USER', descripcion: 'Administrador General y Profesores')
			role_admin.save(flush: true)
		}

		def role_general = Rol.findByNombre('ROLE_SOCIOL_USER')
		if (!role_general) {
			role_general = new Rol(nombre: 'ROLE_SOCIO_USER', descripcion: 'Socio de Siurana')
			role_general.save(flush: true)
		}

		def pablo = Usuario.findByUserName('ptissera')
		if (!pablo) {
			pablo = new Usuario(userName: 'ptissera', nombre: 'Pablo', apellido: 'Tissera' ,password: '123', deleted: false)
			pablo.setRol(role_super)			
			pablo.save flush: true
		}
		
		def fran = Usuario.findByUserName('fpedrozo')
		if (!fran) {
			fran = new Usuario(userName: 'fpedrozo', nombre: 'Francisco', apellido: 'Pedrozo' ,password: '123', deleted: false)
			fran.setRol(role_super)
			fran.save flush: true
		}
	}

	def initPerfiles(){
		def perfil1 = Perfil.findByNombre('Palestra libre')
		if (!perfil1) {
			perfil1 = new Perfil(nombre: 'Palestra libre', descripcion: 'Palestra libre para todas las edades', arancel: 250, esLibre: true, nroDeClases: 12)
			perfil1.save(flush: true)
		}

		def perfil2 = Perfil.findByNombre('Palestra niños')
		if (!perfil2) {
			perfil2 = new Perfil(nombre: 'Palestra niños', descripcion: 'Clases dirigidas a ni±os entre 6 y 11 años', arancel: 300, esLibre: false,	nroDeClases: 8)
			perfil2.save(flush: true)
		}

		def perfil3 = Perfil.findByNombre('Yoga')
		if (!perfil3) {
			perfil3 = new Perfil(nombre: 'Yoga', descripcion: 'Yoga', arancel: 300, esLibre: false,	nroDeClases: 8)
			perfil3.save(flush: true)
		}
	}
}
