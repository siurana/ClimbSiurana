package com.pulko.siurana.core
import com.pulko.siurana.fi.Cobro

class PerfilDeSocio {

    Socio socio
    Perfil perfil
	
    static PerfilDeSocio link(socio, perfil) {
        def m = PerfilDeSocio.findBySocioAndPerfil(socio, perfil)
        if (!m)
        {
            m = new PerfilDeSocio()
            socio?.addToPerfilesDeSocio(m)
            perfil?.addToPerfilesDeSocio(m)
            m.save()
        }
        return m
    }

    static void unlink(socio, perfil) {
        def m = PerfilDeSocio.findBySocioAndPerfil(socio, perfil)
        if (m)
        {
            socio?.removeFromPerfilesDeSocio(m)
            perfil?.removeFromPerfilesDeSocio(m)
            m.delete()
        }
    }
    
    @Override String toString() {
		
        return getSocio().toString() +" --  ["+ getPerfil().toString()+"]" 
		
    }
}

