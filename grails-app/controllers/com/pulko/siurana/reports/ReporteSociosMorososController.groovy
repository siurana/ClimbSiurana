package com.pulko.siurana.reports

import com.pulko.siurana.core.Socio

class ReporteSociosMorososController {

    def index() { }
	
	def result(){
						
//		def query1 = Socio.where {
//			activo==true && cobros.size()==0
//		}
		
		def query2 = Socio.where {
			(activo==true && !(month(cobros.fechaHora)==params.fecha_month && year(cobros.fechaHora)==params.fecha_year))
		}
		
		def lista = (query2.list()).sort{it.apellido}
		
		Double totalMorosos = lista.sum{ socio -> 
			socio.modalidades.sum{ modalidad ->
				modalidad.perfil.arancel
			} 
		}
		
		[fecha: params.fecha, totalMorosos:totalMorosos, lista: lista, morososInstanceCount: lista.size()]
	}
}
