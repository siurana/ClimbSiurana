package siurana

class PerfilDeUsuario {

	String nombre
	double arancel
	String descripcion
	
	static hasMany = [usuarios: Usuario]

	static constraints = {
		nombre blank: false, unique: true
		arancel blank: true
		descripcion blank: false, maxSize: 50
	}
   
	@Override String toString() {
		return getDescripcion()
	}
}
