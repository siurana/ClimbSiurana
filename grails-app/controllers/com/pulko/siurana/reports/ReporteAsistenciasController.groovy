package com.pulko.siurana.reports

class ReporteAsistenciasController {

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

		def cobrosPorDia = CobroPorDia.findAll {
			(fecha > fromDate) && (fecha < toDate)
		}

		def movimientosContables = MovimientoContable.findAll {
			(fechaHora > fromDate) && (fechaHora < toDate)
		}

		Double totalPalePorMes=cobros.sum{ it.monto }
		Double totalPalePorDia=cobrosPorDia.sum{ it.monto }
		if(totalPalePorMes==null){
			totalPalePorMes = 0
		}
		
		if(totalPalePorDia==null){
			totalPalePorDia = 0
		}
		
		
		Double saldo = totalPalePorMes
		
		def movimientos = []
		movimientos << [fecha:params.fecha, rubro: 'Muro', subRubro:'pases', detalle: 'Cuotas mensuales', egreso: 0, ingreso:totalPalePorMes, saldo: saldo]

		saldo += totalPalePorDia
		movimientos << [fecha:params.fecha, rubro: 'Muro', subRubro:'pago por dia', detalle: 'Pagos diarios', egreso: 0, ingreso:totalPalePorDia, saldo: saldo]

		Double ingresos = saldo
		Double egresos = 0

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
