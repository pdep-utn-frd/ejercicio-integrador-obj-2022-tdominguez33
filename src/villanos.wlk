import minions.*
import armas.*
import maldades.*

class Villano{
	var property minions = []
	
	method nuevoMinion(minion){
		minions.add(minion)							//Añadimos un minion a la colección
	}
	
	method otorgarArma(minion, arma){
		minion.armas().add(arma)					//Añadimos un arma a la colección del minion
	}
	
	method alimentar(minion, bananas){
		minion.bananas(minion.bananas() + bananas)	//Añadimos una cantidad de bananas al minion
	}
	
	method nivelDeConcentracion(minion){
		return minion.concentracion()				//Devolvemos el nivel de concentracion del minion
	}
	
	method esPeligroso(minion){
		return minion.esPeligroso()
	}
	
	method congelar(){
		maldadCongelar.hacerMaldad(self)
	}
	
	method robar(objeto){
		maldadRobar.hacerMaldad(self, objeto)
	}
	
	method minionMasUtil(){
		return minions.max({minion => minion.maldadesParticipadas()})
	}
	
	method minionsMasInutiles(){
		return minions.filter({minion => minion.maldadesParticipadas() == 0})
	}
}
