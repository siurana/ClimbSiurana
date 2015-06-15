import com.pulko.siurana.core.Perfil
import com.pulko.siurana.core.Rol
import com.pulko.siurana.core.Usuario
import com.pulko.siurana.fi.Rubro
import com.pulko.siurana.fi.SubRubro

class BootStrap {

	def init = { servletContext ->
		initRolesAndUsers()
		initPerfiles()
		//initRubros()
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
	
	def initRubros(){
		def rubro_muro = Rubro.findByNombre('Muro')
		if (!rubro_muro) {
			rubro_muro = new Rubro(nombre: 'Muro', descripcion: 'La pale')
			rubro_muro.save(flush: true)
		}
		
		def rubro_bar = Rubro.findByNombre('Bar')
		if (!rubro_bar) {
			rubro_bar = new Rubro(nombre: 'Bar', descripcion: 'Bar')
			rubro_bar.save(flush: true)
		}
		
		def rubro_tienda = Rubro.findByNombre('Tienda')
		if (!rubro_tienda) {
			rubro_tienda = new Rubro(nombre: 'Tienda', descripcion: 'Tienda')
			rubro_tienda.save(flush: true)
		}
		
		def rubro_salones = Rubro.findByNombre('Salones')
		if (!rubro_salones) {
			rubro_salones = new Rubro(nombre: 'Salones', descripcion: 'Salones')
			rubro_salones.save(flush: true)
		}
		
		def subrubro_muro1 = SubRubro.findByNombre('Agua Regondi mes de enero')
		if (!subrubro_muro1) {
			subrubro_muro1 = new SubRubro(nombre: 'Agua Regondi mes de enero', descripcion: 'Agua Regondi mes de enero', tipo: 'Egreso')
			subrubro_muro1.setRubro(rubro_muro)
			subrubro_muro1.save(flush: true)
		}
		
		def subrubro_muro2 = SubRubro.findByNombre('Impuestos negocio/contador')
		if (!subrubro_muro2) {
			subrubro_muro2 = new SubRubro(nombre: 'Impuestos negocio/contador', descripcion: 'Impuestos negocio/contador', tipo: 'Egreso')
			subrubro_muro2.setRubro(rubro_muro)
			subrubro_muro2.save(flush: true)
		}
		
		def subrubro_bar1 = SubRubro.findByNombre('Costos')
		if (!subrubro_bar1) {
			subrubro_bar1 = new SubRubro(nombre: 'Costos', descripcion: 'Bar, cerveza', tipo: 'Egreso')
			subrubro_bar1.setRubro(rubro_bar)
			subrubro_bar1.save(flush: true)
		}
		
		def subrubro_bar2 = SubRubro.findByNombre('Venta')
		if (!subrubro_bar2) {
			subrubro_bar2 = new SubRubro(nombre: 'Venta', descripcion: 'Bar, cerveza', tipo: 'Ingreso')
			subrubro_bar2.setRubro(rubro_bar)
			subrubro_bar2.save(flush: true)
		}
		
		def subrubro_tienda1 = SubRubro.findByNombre('Costos')
		if (!subrubro_tienda1) {
			subrubro_tienda1 = new SubRubro(nombre: 'Costos', descripcion: 'Pago %Drow', tipo: 'Egreso')
			subrubro_tienda1.setRubro(rubro_tienda)
			subrubro_tienda1.save(flush: true)
		}
		
		def subrubro_tienda2 = SubRubro.findByNombre('Venta')
		if (!subrubro_tienda2) {
			subrubro_tienda2 = new SubRubro(nombre: 'Venta', descripcion: 'Magnesio Drow', tipo: 'Ingreso')
			subrubro_tienda2.setRubro(rubro_tienda)
			subrubro_tienda2.save(flush: true)
		}
		
		def subrubro_salones1 = SubRubro.findByNombre('Alquiler')
		if (!subrubro_salones1) {
			subrubro_salones1 = new SubRubro(nombre: 'Alquiler', descripcion: 'Taller Resolado', tipo: 'Ingreso')
			subrubro_salones1.setRubro(rubro_salones)
			subrubro_salones1.save(flush: true)
		}
		
		def subrubro_salones2 = SubRubro.findByNombre('Yoga')
		if (!subrubro_salones2) {
			subrubro_salones2 = new SubRubro(nombre: 'Yoga', descripcion: '% alumnos Fer', tipo: 'Ingreso')
			subrubro_salones2.setRubro(rubro_salones)
			subrubro_salones2.save(flush: true)
		}
		
		
	}

	def initPerfiles(){
		def perfil1 = Perfil.findByNombre('Palestra libre')
		if (!perfil1) {
			perfil1 = new Perfil(nombre: 'Palestra libre', descripcion: 'Palestra libre para todas las edades', arancel: 250, esLibre: true, nroDeClases: 12)
			perfil1.save(flush: true)
		}

		def perfil2 = Perfil.findByNombre('Palestra menores')
		if (!perfil2) {
			perfil2 = new Perfil(nombre: 'Palestra menores', descripcion: 'Clases dirigidas a menores entre 6 y 11', arancel: 300, esLibre: false,	nroDeClases: 8)
			perfil2.save(flush: true)
		}
	}
}
