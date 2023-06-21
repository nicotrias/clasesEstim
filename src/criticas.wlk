class Review {
	method resultadoCritica(unJuego)
	method textoCritica()
}

class ReviewUsuario inherits Review {
	var property critica
	override method resultadoCritica(unJuego) = critica
	override method textoCritica() = critica.textoCritica()
}

class ReviewCriticoPago inherits Review {
	const property juegosQuePagaron = #{}
	const property textoRandom = ""
	
	method agregarJuegosQuePagaron(listaDeJuegos) {juegosQuePagaron.addAll(listaDeJuegos)}
	method quitarJuegoQuePagaron(unJuego) {juegosQuePagaron.remove(unJuego)}
	override method resultadoCritica(unJuego) {return
		if(juegosQuePagaron.contains(unJuego)) positiva
		else negativa
	}
	override method textoCritica() = textoRandom
}

class ReviewRevista inherits Review {
	const property criticos = []
	override method textoCritica() = self.concatenarStrings(criticos)
	override method resultadoCritica(unJuego) = 
		if(self.criticosQueCalificaronPositivo(unJuego).size() > criticos.size() /2) positiva
		else negativa
	
	method criticosQueCalificaronPositivo(unJuego) {return
		criticos.filter({c=>c.resultadoCritica(unJuego) == positiva})
	}
	
	method concatenarStrings(unaColeccion) {
		var concatenado = ""
		criticos.forEach({critico =>
			concatenado += critico.textoRandom()
		})
		return concatenado
	}
}

object positiva {
	method textoCritica() = "SI"
}

object negativa {
	method textoCritica() = "NO"
}