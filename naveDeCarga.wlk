// Naves de carga: nos interesa saber la masa de la carga que está transportando, medida en kg. 
// Se desea saber si la nave está sobrecargada, que sucede cuando su carga excede 100 toneladas;
// y si está excedida de velocidad. 
// Sabemos de este tipo de naves que están excedidas de velocidad cuando viajan a más de 100.000 kms/seg.
// Cuando estas naves reciben una amenaza se deshacen de toda su carga, dejándola vacía.

class NaveDeCarga {
    // expresada en km/s
    var property velocidad = 0
    // expresada en kg 
    var property masaTransportada = 0

    // esta sobrecargada si la masa transportada es mayor a 100 toneladas
    method estaSobrecargada() {
        return masaTransportada > 100000
    }

    // Sabemos de este tipo de naves que están excedidas de velocidad cuando viajan 
    // a más de 100.000 kms/seg.
    method estaExcedidaDeVelocidad() {
        return velocidad > 100000
    }
}