package com.pulko.siurana.reports

import com.pulko.siurana.fi.Cobro
import com.pulko.siurana.fi.MovimientoContable
import groovy.time.TimeCategory

class ReporteMovimientosContablesController {

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
		
		def movimientosContables = MovimientoContable.findAll {
			(fechaHora > fromDate) && (fechaHora < toDate)
		}
				
		Double saldo = cobros.sum{ it.monto }
		Double ingresos = saldo
		Double egresos = 0
		
		def movimientos = []
		movimientos << [fecha:params.fecha, rubro: 'Muro', subRubro:'pases', detalle: 'Cuotas mensuales', egreso: 0, ingreso:saldo, saldo: saldo]
		
		movimientosContables.each{ mov ->			
			if("Ingreso" == mov.subRubro.tipo) {
				saldo+=mov.monto
				ingresos+=mov.monto
				movimientos << [fecha:mov.fechaHora, rubro: mov.subRubro.rubro, subRubro: mov.subRubro, detalle: mov.detalle, egreso: 0, ingreso:mov.monto, saldo: saldo]
			} else {
				saldo-=mov.monto
				egresos-=mov.monto
				movimientos << [fecha:mov.fechaHora, rubro: mov.subRubro.rubro, subRubro: mov.subRubro, detalle: mov.detalle, egreso: (-1 * mov.monto), ingreso:0, saldo: saldo]
			}
			
		}
		
		[fecha: params.fecha, ingresos: ingresos, egresos:egresos,saldo:saldo, movimientos:movimientos]
	}
}
