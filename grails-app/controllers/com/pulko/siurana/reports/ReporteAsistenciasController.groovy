package com.pulko.siurana.reports
import com.pulko.siurana.core.Asistencia

class ReporteAsistenciasController {

    def index() { }

	def result(){
		
		def lista = Asistencia.executeQuery("select fechaHora, count(*) as cantidad from Asistencia where fechaHora >= :fechaDesde and fechaHora <= :fechaHasta group by fechaHora order by fechaHora",
			[ fechaDesde: params.fechaDesde, fechaHasta: params.fechaHasta])
		
		def totalAsistencias = 0
		lista.each { item ->
			totalAsistencias += item[1]
		}
				
		[lista: lista, totalAsistencias: totalAsistencias, fechaDesde: params.fechaDesde,  fechaHasta:params.fechaHasta]
	}
}
