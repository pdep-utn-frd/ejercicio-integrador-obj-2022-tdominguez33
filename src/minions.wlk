import armas.*
import villanos.*
import maldades.*

class Minion{
	var property nombre
	var property color = amarillo
	var property bananas = 5
	var property armas = [rayoCongelante]
	var property maldadesParticipadas = 0
	
	method tomarSuero(){
		color.tomarSuero(self)
	}
	
	method esPeligroso(){
		return color.esPeligroso(self)
	}
	
	method concentracion(){
		return color.concentracion(self)
	}
}

object amarillo{
	method tomarSuero(minion){
		minion.color(violeta)					//Cambia de Color
		minion.armas([])						//Pierde Armas
		minion.bananas(minion.bananas() - 1)	//Pierde una banana
	}
	
	method esPeligroso(minion){
		return (minion.armas().size() > 2)		//Su cantidad de armas es mayor a 2
	}
	
	method concentracion(minion){
		return minion.armas().max({arma => arma.potencia()}).potencia() + minion.bananas()	//Potencia de su arma mas potente y su cantidad de bananas
	}
}

object violeta{
	method tomarSuero(minion){
		minion.color(amarillo)					//Cambia de color
		minion.bananas(minion.bananas() - 1)	//Pierde una Banana
	}
	
	method esPeligroso(minion){
		return true								//Los minions violetas siempre son peligrosos
	}
	
	method concentracion(minion){
		return minion.bananas()					//Cantidad de bananas del minion
	}
}