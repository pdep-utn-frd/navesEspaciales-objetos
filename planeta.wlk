// Las naves están registradas en sus planetas de residencia. Se quiere hacer:
// Averiguar cuantas naves están sobrecargadas en un planeta.
// Realizar una invasión a un planeta, que hace que todas sus naves sean amenazadas.
// Que las naves de más de una velocidad dada, se vayan de un planeta a otro.
import naveDeCombate.*
import naveDeCarga.*
import naveDePasajeros.NaveDePasajeros

class Planeta {
    var navesRegistradas = []

    method agregarNaves(listaDeNaves) {
        const conjuntoDeNavesNuevas = listaDeNaves.asSet()
        navesRegistradas = navesRegistradas.asSet().union(conjuntoDeNavesNuevas).asList()
    } 

    method agregarNave(unaNave) {
        navesRegistradas.add(unaNave)
    }

    // Realizar una invasión a un planeta, que hace que todas sus naves sean amenazadas.
    method recibirInvasion() {
        // map  , forEach
        navesRegistradas.forEach( { nave => nave.recibeAmenaza() } ) 
    }

    method moverAotroPlaneta(otroPlaneta, velocidad) {
        const navesQueSuperanVelocidad = navesRegistradas.filter({nave => nave.velocidad() > velocidad})

        // agrego naves teniendo en cuenta repetidos
        otroPlaneta.agregarNaves(navesQueSuperanVelocidad)

        // saco las naves que se fueron al otro planeta
        // Naves = LasQueEstaban - LasQueSeFueron
        navesRegistradas = navesRegistradas.asSet().difference(navesQueSuperanVelocidad.asSet())
    }
    // Averiguar cuantas naves están sobrecargas en un planeta.
    method cantidadDeNavesSobrecargadas() {
        return navesRegistradas.filter({ nave => nave.estaSobrecargada()}).size()
    }
}