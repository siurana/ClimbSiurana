package com.pulko.siurana.tools

import com.pulko.siurana.core.Socio

class CargarDeSociosDesdeExcelController {


	def doUpload() {
		def file = request.getFile('file')
		BookExcelImporter importer = new BookExcelImporter();
		def booksMapList = importer.getBooks(file);
   
		booksMapList.each { Map bookParams ->
		 	println bookParams
		}
			
		redirect (action:'list')
	}
	
    def upload() {
		
	}
}
