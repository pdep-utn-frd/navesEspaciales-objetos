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