package com.pulko.siurana.core

class PerfilDeUsuario {

    Usuario usuario
	Perfil perfil
	static PerfilDeUsuario link(usuario, perfil) {
		def m = PerfilDeUsuario.findByUsuarioAndPerfil(usuario, perfil)
		if (!m)
		{
			m = new PerfilDeUsuario()
			usuario?.addToPerfilesDeUsuario(m)
			perfil?.addToPerfilesDeUsuario(m)
			m.save()
		}
		return m
	}

	static void unlink(usuario, perfil) {
		def m = PerfilDeUsuario.findByUsuarioAndPerfil(usuario, perfil)
		if (m)
		{
			usuario?.removeFromPerfilesDeUsuario(m)
			perfil?.removeFromPerfilesDeUsuario(m)
			m.delete()
		}
	}
}
