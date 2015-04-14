package com.pulko.siurana.reports

import com.pulko.siurana.fi.Cobro
import groovy.time.TimeCategory

class ReporteCobrosPorMesController {

    def index() { }
	
	def result(){
		def fromDate = params.fecha - 1
		def toDate
		
		use(TimeCategory) {
			toDate = params.fecha + 1.month
		}
		
		def cobros = Cobro.findAll {
			(fechaHora > fromDate) && (fechaHora < toDate)
		}
		
		if(cobros.size()==0){
			request.withFormat {
				form multipartForm {
					flash.message = "No hubo resultado para el mes seleccionado"
					redirect action: "index", method: "GET"
				}
				'*'{ render  status: NOT_FOUND}
			}
			return
		}
		
		Double totalAcumulado = cobros.sum{ it.monto }
		
		[fecha: params.fecha, totalAcumulado:totalAcumulado, cobros: cobros, cobroInstanceCount: cobros.size()]
	}
}
