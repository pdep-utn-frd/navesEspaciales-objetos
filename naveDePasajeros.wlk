// Naves de pasajeros: lleva consigo una determinada cantidad de pasajeros 
// + 4 personas destinadas a ser personal de la nave. 
// Cuando estas naves reciben una amenaza simplemente activan su alarma en caso de emergencia.
//  Se desea conocer la velocidad máxima legal a la que puede viajar, que es de 300.000 kms/seg
//  dividido la cantidad de personas dentro de la nave (pasajeros + personal de la nave),
//  además se descuenta 200 kms/seg más si hay más de 100 pasajeros, por cuestiones de seguridad.
// Y saber si la nave está en peligro, que sucede cuando va más rápido que su velocidad máxima legal
// o la alarma en caso de emergencia está encendida. 
// Está sobrecargada si tiene más de 6 personas en total.

class NaveDePasajeros {
    var property velocidad = 0
    var cantidadDePasajeros = 0
    const tripulacion = 4
    var alarmaActivada = false

    method cantidadTotalDePersonasABordo() {
        return cantidadDePasajeros + tripulacion
    }

    method cantidadDePasajeros(unaCantidad) {
        cantidadDePasajeros = unaCantidad
    }

    method recibeAmenaza() {
        alarmaActivada = true
    }

    //  Se desea conocer la velocidad máxima legal a la que puede viajar, que es de 300.000 kms/seg
    //  dividido la cantidad de personas dentro de la nave (pasajeros + personal de la nave),
    //  además se descuenta 200 kms/seg más si hay más de 100 pasajeros, por cuestiones de seguridad.
    method velocidadMaximaLegal() {
        var velocidadMaxima = 300000/self.cantidadTotalDePersonasABordo()
        if (cantidadDePasajeros > 100) {
            velocidadMaxima -= 200
        }

        return velocidadMaxima
    }

    method estaEnPeligro() {
        return (velocidad > self.velocidadMaximaLegal()) || alarmaActivada
    }

    method estaSobrecargada() {
        return self.cantidadTotalDePersonasABordo() > 6
    }
 
}