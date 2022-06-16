class Villanos {
	const subditos = []
	method nuevoMinion(){
		subditos.add(new Minion(cantidadBananas = 5, armas = [rayoCongelante]))
	}
	
	method otorgarArma(minion, arma){
		minion.recibirArma(arma)
	}
	
	method alimentar(minion, bananas){
		minion.alimentar(bananas)
	}
	
	method nivelDeConcentracion(minion){
		return minion.concentracion()
	}
	
	method esPeligroso(minion){
		return (minion.color() == "violeta")
	}
	
	method congelar(){
		const aliados = []
		subditos.forEach({minion => 
			if (minion.armas().any{arma => arma == rayoCongelante} and minion.potencia() >= 500){
				aliados.add(minion)
			}
		})
		aliados.forEach({minion => minion.cantidadBananas(minion.cantidadBananas() + 10)})
		if (aliados != []){
			ciudad.temperatura(ciudad.temperatura() - 30)
		}
	}
	
	method robar(objetivo){
		const aliados = []
		subditos.forEach({minion => 
			if (self.esPeligroso(minion) and minion.cumpleRequisitos()){
				aliados.add(minion)
			}
		})
	}
}

class Minion {
	var property color = "amarillo"
	var property cantidadBananas = 0
	var property concentracion = self.armaMasPotente() + cantidadBananas
	const property armas = []
	
	method recibirArma(arma){
		armas.add(arma)
	}
	
	method alimentar(bananas){
		cantidadBananas += bananas
	}
	
	method armaMasPotente(){
		return armas.max{arma => arma.potencia()}
	}
	
	method cumpleRequisitos(objeto){
		if (objeto == piramide){
			return concentracion >= (piramide.altura()/2)
		}
		if (objeto == sueroMutante){
			return concentracion >= 23
		}
		if (objeto == luna){
			return armas.any{arma => arma == rayoCongelante}
		}
		else return false
	}
}

class Arma {
	var property potencia
}

const rayoCongelante = new Arma(potencia = 10)

object ciudad{
	var property temperatura = 30
}

object piramide{
	var property altura = 0
	var property recompensa = 10
}

object sueroMutante{
	var property concentracionRequerida = 23
}

object luna{
	
}
