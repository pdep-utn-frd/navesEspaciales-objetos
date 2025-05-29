// Naves de combate: pueden emitir mensajes y tiene inicialmente 2 modos: en reposo o ataque. 

// Su mejor característica es que pueden estar invisibles para los enemigos,
// lo que ocurre si viajan a menos de 10.000 kms/seg en modo reposo,
// o si no tienen las armas desplegadas cuando están en modo ataque.


// Al recibir una amenaza, si está en reposo emite el mensaje "¡RETIRADA!"
// y en modo ataque emite el mensaje "Enemigo encontrado" y despliega sus armas.

// Se considera sobrecargada cuando no es invisible.

class NaveDeCombate {
    var property velocidad = 0
    var property armasDesplegadas = false
    var property modo = modoReposo
    var property mensajeEmitido = ""

    method desplegarArmas() {
        armasDesplegadas = true
    }

    // Se considera sobrecargada cuando no es invisible.
    method estaSobrecargada() {
        return !modo.naveEstaInvisible(self)
    }

    method escape() {
        modo = new ModoEscape(potencia=100)
    }

    method recibeAmenaza() {
        modo.recibeAmenaza(self) 
    }
}

object modoReposo {
    //  lo que ocurre si viajan a menos de 10.000 kms/seg en modo reposo,
                            // un numero
    method naveEstaInvisible(unaNave) {
        return unaNave.velocidad() < 10000
    }

    method recibeAmenaza(unaNave) {
        unaNave.mensajeEmitido("¡RETIRADA!")
    } 
}

object modoAtaque {
    // si no tienen las armas desplegadas cuando están en modo ataque.
    method naveEstaInvisible(unaNave) {
        return !unaNave.armasDesplegadas()
    }

    method recibeAmenaza(unaNave) {
        unaNave.mensajeEmitido("Enemigo encontrado")
        unaNave.desplegarArmas()
    }
}

// Aparece un nuevo modo para las naves de combate, llamado escape. En ese modo, a cada nave que se esta escapando le corresponde una potencia de escape determinada, que se disminuye a la mitad cuando la nave es amenazada estando en ese modo. 
// Permitir que una nave de combate escape, lo que provoca que independientemente del estado anterior, pasa a estar en estado escape, con potencia de 100. 
// ¿Qué otras cosas habría que tener en cuenta para que todo lo anterior siga funcionando? En caso de ser necesario, completarlo.

class ModoEscape {
    var property potencia = 0

    method recibeAmenaza(unaNave) {
        potencia = potencia/2
    }
}