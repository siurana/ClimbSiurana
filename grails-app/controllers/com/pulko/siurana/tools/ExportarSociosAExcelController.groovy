package com.pulko.siurana.tools

import jxl.*
import jxl.write.*

import com.pulko.siurana.core.Socio

class ExportarSociosAExcelController {

    def report = {
        WorkbookSettings workbookSettings = new WorkbookSettings()
        workbookSettings.locale = Locale.default

		response.setHeader("Content-disposition", "attachment; filename=Socios.xls")
		response.contentType = "application/vnd.ms-excel"

		BufferedOutputStream out = new BufferedOutputStream(response.outputStream)
		
        WritableWorkbook workbook = Workbook.createWorkbook(out, workbookSettings)
        WritableFont font = new WritableFont(WritableFont.ARIAL, 12)
        WritableCellFormat format = new WritableCellFormat(font)

		// 	0	Apellido
		//	1	Nombre
		//	2	DNI
		//	3	Fecha de Nacimiento
		//	4	Domicilio
		//	5	Mail
		//	6	Tel�fono
		//	7	Celular
		//	8	Apellido
		//	9	Nombre
		//	10	Tel�fono
		//	11	Celular
		//	12	Fecha ingreso
		//	13	Modalidad de pago
		//	14	Observaciones
		//	15	Activo
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
		sheet.addCell(new Label(8, row, "Apellido Del Contacto De Emergencia"))
		sheet.addCell(new Label(9, row, "Nombre Del Contacto De Emergencia"))
		sheet.addCell(new Label(10, row, "Telefono Del Contacto De Emergencia"))
		sheet.addCell(new Label(11, row, "Celular Del Contacto De Emergencia"))
		sheet.addCell(new Label(12, row, "Fecha De Ingreso"))
		sheet.addCell(new Label(13, row, "Modalidades"))
		sheet.addCell(new Label(14, row, "Observaciones"))
		sheet.addCell(new Label(15, row, "Activo"))
        Socio.list().each {  
			if(!it.esMenor){
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
				sheet.addCell(new Label(8, row, it.apellidoContactoDeEmergencia))
				sheet.addCell(new Label(9, row, it.nombreContactoDeEmergencia))
				sheet.addCell(new Label(10, row, it.telefonoContactoDeEmergencia))
				sheet.addCell(new Label(11, row, it.celularContactoDeEmergencia))
				if(it.fechaDeIngreso){
					sheet.addCell(new Label(12, row, it.fechaDeIngreso.format("dd/MM/yyyy")))
				}
				def modalidadDetail = ""
				def separador=""
				it.modalidades.each { modalidad->
					modalidadDetail+=separador
					modalidadDetail+=modalidad.perfil				
					separador=", "
									
				}
				
				sheet.addCell(new Label(13, row, modalidadDetail))
				sheet.addCell(new Label(14, row, it.observaciones))
				sheet.addCell(new Label(15, row, String.valueOf(it.activo)))
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
