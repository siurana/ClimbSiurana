package com.pulko.siurana.tools

import jxl.*
import jxl.write.*

import com.pulko.siurana.core.Socio

class ExportarSociosMenoresAExcelController {

   def report = {
        WorkbookSettings workbookSettings = new WorkbookSettings()
        workbookSettings.locale = Locale.default

		response.setHeader("Content-disposition", "attachment; filename=SociosMenores.xls")
		response.contentType = "application/vnd.ms-excel"

		BufferedOutputStream out = new BufferedOutputStream(response.outputStream)
		
        WritableWorkbook workbook = Workbook.createWorkbook(out, workbookSettings)
        WritableFont font = new WritableFont(WritableFont.ARIAL, 12)
        WritableCellFormat format = new WritableCellFormat(font)

		//	0	Apellido
		//	1	Nombre
		//	2	DNI
		//	3	Fecha de Nacimiento
		//	4	Domicilio
		//	5	Mail
		//	6	Teléfono
		//	7	Celular
		
		//	8	Apellido Padre
		//	9	Nombre Padre
		//	10	DNI Padre
		//	11	Domicilio Padre
		//	12	Mail Padre
		//	13	Teléfono Padre
		//	14	Celular Padre
		
		//	15	Apellido Madre		
		//	16	Nombre Madre
		//	17	DNI Madre
		//	18	Domicilio Madre
		//	19	Mail Madre
		//	20	Teléfono Madre
		//	21	Celular Madre
		
		//	22	Fecha ingreso
		//	23	Modalidad de pago
		//	24	Observaciones
        def row = 1
        WritableSheet sheet = workbook.createSheet('Socios', 0)
		sheet.addCell(new Label(0, row, "Apellido"))
		sheet.addCell(new Label(1, row, "Nnombre"))
		sheet.addCell(new Label(2, row, "DNI"))
		sheet.addCell(new Label(3, row, "Decha De Nacimiento"))
		sheet.addCell(new Label(4, row, "Ddomicilio"))
		sheet.addCell(new Label(5, row, "E-mail"))
		sheet.addCell(new Label(6, row, "Telefono"))
		sheet.addCell(new Label(7, row, "Celular"))
		sheet.addCell(new Label(8, row, "Apellido Padre"))
		sheet.addCell(new Label(9, row, "Nombre Padre"))
		sheet.addCell(new Label(10, row, "DNI Padre"))
		sheet.addCell(new Label(11, row, "Domicilio Padre"))
		sheet.addCell(new Label(12, row, "Mail Padre"))
		sheet.addCell(new Label(13, row, "Teléfono Padre"))
		sheet.addCell(new Label(14, row, "Celular Padre"))
		sheet.addCell(new Label(15, row, "Apellido Madre"))
		sheet.addCell(new Label(16, row, "Nombre Madre"))
		sheet.addCell(new Label(17, row, "DNI Madre"))
		sheet.addCell(new Label(18, row, "Domicilio Madre"))
		sheet.addCell(new Label(19, row, "Mail Madre"))
		sheet.addCell(new Label(20, row, "Teléfono Madre"))
		sheet.addCell(new Label(21, row, "Celular Madre"))
		sheet.addCell(new Label(22, row, "Fecha De Ingreso"))
		sheet.addCell(new Label(23, row, "Modalidades"))
		sheet.addCell(new Label(24, row, "Observaciones"))
        Socio.list().each {  
			if(it.esMenor){
				row++
				sheet.addCell(new Label(0, row, it.apellido))
				sheet.addCell(new Label(1, row, it.nombre))
				sheet.addCell(new Label(2, row, it.dNI))
				if(it.fechaDeNacimiento){
					sheet.addCell(new Label(3, row, it.fechaDeNacimiento.format("dd/MM/yyyy")))
				}
				sheet.addCell(new Label(4, row, it.domicilio))
				sheet.addCell(new Label(5, row, it.email))
				sheet.addCell(new Label(6, row, it.telefono))
				sheet.addCell(new Label(7, row, it.celular))
				
				sheet.addCell(new Label(8, row, it.apellidoDelPadre))
				sheet.addCell(new Label(9, row, it.nombreDelPadre))
				sheet.addCell(new Label(10, row, it.dNIDelPadre))
				sheet.addCell(new Label(11, row, it.domicilioDelPadre))
				sheet.addCell(new Label(12, row, it.emailDelPadre))
				sheet.addCell(new Label(13, row, it.telefonoDelPadre))
				sheet.addCell(new Label(14, row, it.celularDelPadre))
				sheet.addCell(new Label(15, row, it.apellidoDeLaMadre))
				sheet.addCell(new Label(16, row, it.nombreDeLaMadre))
				sheet.addCell(new Label(17, row, it.dNIDeLaMadre))
				sheet.addCell(new Label(18, row, it.domicilioDeLaMadre))
				sheet.addCell(new Label(19, row, it.emailDeLaMadre))
				sheet.addCell(new Label(20, row, it.telefonoDeLaMadre))
				sheet.addCell(new Label(21, row, it.celularDeLaMadre))
				if(it.fechaDeIngreso){
					sheet.addCell(new Label(22, row, it.fechaDeIngreso.format("dd/MM/yyyy")))
				}
				def modalidadDetail = ""
				def separador=""
				it.modalidades.each { modalidad->
					modalidadDetail+=separador
					modalidadDetail+=modalidad.perfil				
					separador=", "
									
				}
				sheet.addCell(new Label(23, row, modalidadDetail))
				sheet.addCell(new Label(24, row, it.observaciones))
			}
		}
        try {
            workbook.write()

        } finally {
			workbook.close()
            return false
        }
    }


}
