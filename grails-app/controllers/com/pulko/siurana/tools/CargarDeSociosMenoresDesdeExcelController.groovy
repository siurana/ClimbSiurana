package com.pulko.siurana.tools

import jxl.Sheet
import jxl.Workbook

import com.pulko.siurana.core.Perfil
import com.pulko.siurana.core.PerfilDeSocio
import com.pulko.siurana.core.Socio

class CargarDeSociosMenoresDesdeExcelController {

    def doUpload() {
		def file = request.getFile('file')
		if(!file.getOriginalFilename().endsWith(".xls")){
			flash.error = "El archivo debe ser del tipo: Hoja de calculo de Microsoft Office Excel 97-2003 (.xls)"
			redirect (action:'upload')
			return
		}
        Workbook workbook = Workbook.getWorkbook(file.getInputStream())
        Sheet sheet = workbook.getSheet(0);

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
		
		def perfil1 = Perfil.findByNombre('Palestra menores')
		int cantidad=0
        for (int row = 3; row < sheet.getRows(); row++) {
			if(!sheet.getCell(1, row).contents || !sheet.getCell(0, row).contents){
				continue;
			}
			def map = [:]
			map.nombre = sheet.getCell(1, row).contents
			map.apellido = sheet.getCell(0, row).contents
			def socio=Socio.findByNombreAndApellido(map.nombre, map.apellido)
			if(!socio){
				map.dNI = sheet.getCell(2, row).contents
				if(sheet.getCell(3, row).contents){
					map.fechaDeNacimiento = Date.parse( 'dd/MM/yyyy', sheet.getCell(3, row).contents)
				}
				map.domicilio = sheet.getCell(4, row).contents
				map.email = sheet.getCell(5, row).contents
				map.telefono = sheet.getCell(6, row).contents
				map.celular = sheet.getCell(7, row).contents
				map.sexo = "M"
				if(sheet.getCell(22, row).contents){
					map.fechaDeIngreso = Date.parse( 'dd/MM/yyyy', sheet.getCell(22, row).contents)
				}
				map.activo = true
				map.esMenor = true
				map.deleted = false
				map.observaciones  = sheet.getCell(24, row).contents
				
				// Datos Padre
				map.nombreDelPadre = sheet.getCell(9, row).contents
				map.apellidoDelPadre = sheet.getCell(8, row).contents
				map.dNIDelPadre = sheet.getCell(10, row).contents
				map.domicilioDelPadre = sheet.getCell(11, row).contents
				map.emailDelPadre = sheet.getCell(12, row).contents
				map.telefonoDelPadre = sheet.getCell(13, row).contents
				map.celularDelPadre = sheet.getCell(14, row).contents
			
				// Datos Madre
				map.nombreDeLaMadre = sheet.getCell(16, row).contents
				map.apellidoDeLaMadre = sheet.getCell(15, row).contents
				map.dNIDeLaMadre = sheet.getCell(17, row).contents
				map.domicilioDeLaMadre = sheet.getCell(18, row).contents
				map.emailDeLaMadre = sheet.getCell(19, row).contents
				map.telefonoDeLaMadre = sheet.getCell(20, row).contents
				map.celularDeLaMadre = sheet.getCell(21, row).contents
				
				socio=new Socio(map).save flush:true
				new PerfilDeSocio(socio: socio, perfil: perfil1).save flush:true
				cantidad++
			}		
        }
		flash.message = "Fueron importados "+cantidad+" socios desde el archivo "+file.getOriginalFilename()
        redirect (action:'upload')
	}
	
    def upload() {
		
	}
}
