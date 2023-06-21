class Pais {
	var valorCambioDolar = 1
	const property aceptaViolentos = true
	const property aceptaLenguajeInapropiado = false
	const property aceptaTematicaAdultos = true
	const property caracteristicasNoPermitidas = #{}


	method precioRegional(unJuego)= unJuego.precio() * valorCambioDolar
	
	
	method puedeVenderElJuego(unJuego) {return
		caracteristicasNoPermitidas.intersection(unJuego.caracteristicas()).isEmpty()
	}
	
}