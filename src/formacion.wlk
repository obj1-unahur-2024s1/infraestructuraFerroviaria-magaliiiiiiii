/** First Wollok example */
import vagones.*
class Formaciones{
	var vagones=[]
	const locomotoras=[]
	
	method agregarVagon(unVagon){vagones.add(unVagon)} 
	method desarmarFormacion(){
		vagones.clear()
		locomotoras.clear()}
	method cantidadDePasajeros(){
		vagones.sum({x=> x.cantidadDepasajero()}) //recorre todos los elementos, y le pasa el mensaje de cantidad de pasajero, asi devuelve otra lista con los elemntos transformados
	}
	method cantidadVagonesPopulares(){ vagones.count({x=> x.esPopular()})}
	// tmb se puede resolver con filter (profe dijo q no es buan practica)
	//method cantidadVagonesPopulares(){ vagones.filter({x=> x.cantidadDePasajeros()>50}).size()}
	method  esFormacionCarguera(){ vagones.all({x=> x.carga()>1000})}
	
	method vagonMasPesado()= vagones.max({x=>x.pesoMax()})
	method vagonMasLiviano()= vagones.min({x=>x.pesoMax()})
	
	method dispersionDePesos(){ self.vagonMasPesado().pesoMax()- self.vagonMasLiviano().pesoMax()}  // hay que incluir el mensaje de pesoMax para que no sea una resta entre vagones
	
	method cantidadConBanios(){ vagones.count({x=> x.tieneBanios()})}
	
	
	//forEach no devuelve nada
	method mantenimiento(){ vagones.forEach({x=> x.mantenimiento()})}  // recorre todos los elemntos y le envia un mensaje a cada elemento de la lista
	
	method vagonesConPasajero()= vagones.filter({x=> x.cantidadDePasajeros()>0})  //aca para que filre los vagones que tienen pasajeros
	method vagonConMasPasajeros()= vagones.max({x=> x.cantidadDePasajeros()})
	method vagonConMenosPasajeros()= vagones.min({x=> x.cantidadDePasajeros()})
	method estaEquilibrada()=
		self.vagonConMasPasajeros().cantidadDePasajeros() - self.vagonConMenosPasajeros().cantidadDePasajeros() <=20 	
	
}