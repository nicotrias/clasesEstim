import descuentos.*
import estim.*
import paises.*
import criticas.*

class Juego {
	const property precio = 100
	var property descuento
	const property caracteristicas = #{}
	const property criticas = []
	

	method precio()=
		if(estim.juegosMasCaros().contains(self))
			precio - descuentoParaJuegosCaros.valorADescontar(self)
		else precio - descuento.valorADescontar(self)
	
	
	method esAptoEnElPais(unPais)= unPais.puedeVenderElJuego(self)
	
	method registrarCritica(critica){
		criticas.add(critica)
	}

	method cantidadDeCriticas()= criticas.size()
	
	method cantidadCriticasPositivas()= criticas.count({c => c.resultadoCritica(self) == positiva })
	
	method tieneCriticasPositivasMayoresA(unPorcentaje)=
		self.cantidadDeCriticas() / (unPorcentaje *0.1) <= self.cantidadCriticasPositivas()
	
	method esJuegoGalardonado()= self.cantidadDeCriticas() == self.cantidadCriticasPositivas()
	
	method tieneCriticasLiterarias()= criticas.any({c => c.textoCritica().size() > 100})
}


object lenguajeInapropiado {}
object violencia {}
object paraAdultos {}