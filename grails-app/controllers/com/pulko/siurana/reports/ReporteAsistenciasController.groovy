package com.pulko.siurana.reports
import com.pulko.siurana.core.Asistencia

class ReporteAsistenciasController {

    def index() { }

	def result(){
		def query = Asistencia.where {
			(fechaHora >= params.fechaDesde && fechaHora <=params.fechaHasta)
		}
		
		def lista = (query.list())
		
				
		[lista: lista, totalAsistencias: lista.size(), fechaDesde: params.fechaDesde,  fechaHasta:params.fechaHasta]
	}
}
