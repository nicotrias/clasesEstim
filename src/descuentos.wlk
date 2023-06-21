import juegos.*


class Descuento {
	var descuento = 0

	
	method valorADescontar(unJuego)
	
}

class DescuentoDirecto inherits Descuento {
		
	override method valorADescontar(unJuego)= unJuego.precio().min(
		unJuego.precio() * ( descuento / 100 ) )
	
}

class DescuentoFijo inherits Descuento {
	
	override method valorADescontar(unJuego)= unJuego.precio().min(descuento)
}

object gratis inherits Descuento {
	
	override method valorADescontar(unJuego)= unJuego.precio()
	
}


class DescuentoBoost inherits DescuentoFijo {
	
	override method valorADescontar(unJuego)= unJuego.precio().min
								(super(unJuego) + descuento*0.5)
}

object descuentoParaJuegosCaros inherits DescuentoDirecto {
	
	override method valorADescontar(unJuego)= unJuego.precio().min(
		unJuego.precio() * ( descuento / 100 ) )
	
	method nuevoDescuento(numero){
		descuento = numero
	}
}