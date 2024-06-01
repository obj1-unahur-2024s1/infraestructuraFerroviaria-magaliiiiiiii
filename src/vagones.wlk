class Vagon{   //clase abstracta
	method esPopular()= self.cantidadDePasajeros()>50
	method escarguero()=self.carga()
	method tieneBanios()
	method pesoMax()
	method carga()
	method mantenimiento()
	method cantidadDePasajeros()
}

class VagonesDePasajeros inherits Vagon{
	const property largo  //con property creamos el metodo de consulta con la variable largo
	const property ancho
	const tieneBanios // (si nunk se cambia el baño, es const: es por diseño)	si dice q no le podes sacar banios nunca, hay q hacerlo por metodod por abrir la ventana del getter
	var estaOrdenado
	
	
	override method tieneBanios()= tieneBanios
	override method cantidadDePasajeros()=
	if(ancho<=3){ 8*self.largo()} else {10*largo}- if(estaOrdenado)0 else 15
	
	override method carga()= if(tieneBanios) 300 else 800
	
	override method pesoMax()=2000+ 80* self.cantidadDePasajeros()+ self.carga()
	//method esPopular(){ return self.cantidadDePasajeros()>50} 
	override method mantenimiento(){estaOrdenado= true}
}

class VagonCarga inherits Vagon{
	const cargamaximaIdeal
	var maderaSueltas
	
	override method carga()= cargamaximaIdeal - 400 * maderaSueltas
	method cantidaDepasajeros()=0  //busco el polimorfismo
	override method tieneBanios()=false
	override method pesoMax()= 1500+ self.carga()
	override method esPopular()=false
	override method mantenimiento(){
		maderaSueltas= 0.max(maderaSueltas-2)
	}
	
}

class VagonDormitorio inherits Vagon{   //nomre en singular porque moldea un vagon 
	const cantidadDeCompartimiento
	var camasPorCompartimiento
	
	override method cantidadDePasajeros()= cantidadDeCompartimiento * camasPorCompartimiento
	override method tieneBanios()= true
	override method carga()=1200
	override method pesoMax()= 4000+ 80* self.cantidadDePasajeros() + self.carga()
	//method esPopular(){ return self.cantidadDePasajeros()>50} 
	override method mantenimiento(){}  //un metodo que no hace nada
}

