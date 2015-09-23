package com.pulko.siurana.reports

import com.pulko.siurana.fi.Cobro
import groovy.time.TimeCategory

class ReporteCobrosPorMesController {

    def index() { }
	
	def result(){
		
		def query = Cobro.where {
			(month(fechaHora)==params.fecha_month && year(fechaHora)==params.fecha_year)
		}
		
		def lista = (query.list()).sort{it.socio.apellido}
		
		if(lista.size()==0){
			request.withFormat {
				form multipartForm {
					flash.message = "No hubo resultado para el mes seleccionado"
					redirect action: "index", method: "GET"
				}
				'*'{ render  status: NOT_FOUND}
			}
			return
		}
		
		Double totalAcumulado = lista.sum{ it.monto }
		
		[fecha: params.fecha, totalAcumulado:totalAcumulado, cobros: lista, cobroInstanceCount: lista.size()]
	}
}
