package com.pulko.siurana.tools

import jxl.Sheet
import jxl.Workbook

import com.pulko.siurana.core.Perfil
import com.pulko.siurana.core.PerfilDeSocio
import com.pulko.siurana.core.Socio

class CargarDeSociosDesdeExcelController {


	def doUpload() {
		def file = request.getFile('file')
		if(!file.getOriginalFilename().endsWith(".xls")){
			flash.error = "El archivo debe ser del tipo: Hoja de calculo de Microsoft Office Excel 97-2003 (.xls)"
			redirect (action:'upload')
			return
		}
        Workbook workbook = Workbook.getWorkbook(file.getInputStream())
        Sheet sheet = workbook.getSheet(0);

		// 	0	Apellido	
		//	1	Nombre	
		//	2	DNI	
		//	3	Fecha de Nacimiento	
		//	4	Domicilio	
		//	5	Mail	
		//	6	Teléfono	
		//	7	Celular	
		//	8	Apellido	
		//	9	Nombre	
		//	10	Telèfono	
		//	11	Celular	
		//	12	Fecha ingreso	
		//	13	Modalidad de pago	
		//	14	Observaciones
		
		def perfil1 = Perfil.findByNombre('Palestra libre')
		int cantidad=0
        for (int row = 2; row < sheet.getRows(); row++) {
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
				if(sheet.getCell(12, row).contents){
					map.fechaDeIngreso = Date.parse( 'dd/MM/yyyy', sheet.getCell(12, row).contents)
				}
				map.activo = true
				map.esMenor = false
				map.deleted = false
				map.observaciones  = sheet.getCell(14, row).contents
				
				// Datos Contacto de Emergencia
				map.nombreContactoDeEmergencia = sheet.getCell(9, row).contents
				map.apellidoContactoDeEmergencia = sheet.getCell(8, row).contents
				map.telefonoContactoDeEmergencia = sheet.getCell(10, row).contents
				map.celularContactoDeEmergencia = sheet.getCell(11, row).contents
				
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
