// Las naves están registradas en sus planetas de residencia. Se quiere hacer:
// Averiguar cuantas naves están sobrecargadas en un planeta.
// Realizar una invasión a un planeta, que hace que todas sus naves sean amenazadas.
// Que las naves de más de una velocidad dada, se vayan de un planeta a otro.
import naveDeCombate.*
import naveDeCarga.*
import naveDePasajeros.NaveDePasajeros

class Planeta {
    const navesRegistradas = []

    method agregarNave(unaNave) {
        navesRegistradas.add(unaNave)
    }

    // Averiguar cuantas naves están sobrecargas en un planeta.
    method cantidadDeNavesSobrecargadas() {
        return navesRegistradas.filter({ nave => nave.estaSobrecargada()}).size()
    }
}