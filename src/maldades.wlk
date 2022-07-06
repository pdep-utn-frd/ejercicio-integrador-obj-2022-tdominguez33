import villanos.*
import armas.*
import minions.*

object maldadCongelar{
	var minionsAptos = []
	method hacerMaldad(villano){
		//Minions con un rayo congelante y concentracion igual a 500
		minionsAptos = villano.minions().filter({minion => minion.armas().any({arma => arma == rayoCongelante}) and villano.nivelDeConcentracion(minion) == 500})
		if (minionsAptos == []){
			throw new Exception(message = "No hay minions Aptos")
		}
		ciudad.temperatura(ciudad.temperatura() - 30)									//Disminuimos la temperatura de la ciudad
		minionsAptos.forEach({minion => villano.alimentar(minion, 10)})					//A todos los minions aptos les sumamos 10 bananas
	}
}

object maldadRobar{
	var property minionsAptos = []
	
	method hacerMaldad(villano, objeto){
		minionsAptos = objeto.minionsAptos(villano)		//Definimos los minions que son aptos
		objeto.robar(villano)							//Intentamos robar el objeto
	}
}

object piramides{
	const altura = 500
	method minionsAptos(villano){
		return villano.minions().filter({minion => villano.nivelDeConcentracion(minion) > altura/2})
	}
	
	method robar(villano){
		if (maldadRobar.minionsAptos() == []){
			throw new Exception(message = "No hay minions Aptos")
		}
		maldadRobar.minionsAptos().forEach({minionApto => villano.alimentar(minionApto, 10)})											//Sumamos 10 bananas
		maldadRobar.minionsAptos().forEach({minionApto => (minionApto.maldadesParticipadas(minionApto.maldadesParticipadas() + 1))})	//Se le suma una maldad a los minions que participaron
		ciudad.propiedades().remove(self)
	}
}

object sueroMutante{
	method minionsAptos(villano){
		return villano.minions().filter({minion => (minion.bananas() >= 100) and (villano.nivelDeConcentracion(minion) >= 23)})
	}
	
	method robar(villano){
		if (maldadRobar.minionsAptos() == []){
			throw new Exception(message = "No hay minions Aptos")
		}
		maldadRobar.minionsAptos().forEach({minionApto => (minionApto.tomarSuero())})													//Todos los minions que participan toman el suero
		maldadRobar.minionsAptos().forEach({minionApto => (minionApto.maldadesParticipadas(minionApto.maldadesParticipadas() + 1))})	//Se le suma una maldad a los minions que participaron
		ciudad.propiedades().remove(self)
	}
}

object luna{
	method minionsAptos(villano){
		return villano.minions().filter({minion => minion.armas().any({arma => arma == rayoParaEncoger})})
	}
	
	method robar(villano){
		if (maldadRobar.minionsAptos() == []){
			throw new Exception(message = "No hay minions Aptos")
		}
			maldadRobar.minionsAptos().forEach({minionApto => villano.otorgarArma(minionApto, rayoCongelante)})								//A todos los minions se le da un rayo congelante
			maldadRobar.minionsAptos().forEach({minionApto => (minionApto.maldadesParticipadas(minionApto.maldadesParticipadas() + 1))})	//Se le suma una maldad a los minions que participaron
			ciudad.propiedades().remove(self)
	}
}

object ciudad{
	var property temperatura = 30
	var property propiedades = [piramides, sueroMutante, luna]
}
