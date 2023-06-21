import descuentos.*
import juegos.*
import paises.*

object estim {
	
	const juegos = #{}
	
	method agregarJuego(unJuego){
		juegos.add(unJuego)
	}
	
	method sacarJuego(unJuego){
		juegos.remove(unJuego)
	}
	
	
	method juegoMasCaro()= juegos.max({j => j.precio()})
	
	method juegosMasCaros()= juegos.filter({j => j.precio() > self.juegoMasCaro().precio() *0.75 })

	method juegosAptosParaMenoresEn(unPais)=juegos.filter({j => j.esAptoEnElPais(unPais)})
	
	
	method cantidadDeJuegosAptosParaMenoresEn(unPais)= 
			self.juegosAptosParaMenoresEn(unPais).size()
	
	 method preciosLocalesDeJuegosAptosParaElPais(unPais)=
		self.juegosAptosParaMenoresEn(unPais).sum({ j=> unPais.precioRegional(j)})
	
	
	method promedioPrecioAptosMenoresEn(unPais)= 
		self.preciosLocalesDeJuegosAptosParaElPais(unPais) / 
		self.cantidadDeJuegosAptosParaMenoresEn(unPais)

	method esJuegoGalardonado(unJuego)= unJuego.esJuegoGalardonado()	
}
