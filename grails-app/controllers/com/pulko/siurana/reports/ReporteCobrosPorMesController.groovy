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
		Double totalAcumulado = cobros.sum{ it.monto }
		[fecha: params.fecha, totalAcumulado:totalAcumulado, cobros: cobros, cobroInstanceCount: cobros.size()]
	}
}
