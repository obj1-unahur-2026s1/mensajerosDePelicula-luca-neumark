object bici {
  method peso() = 5
}

object camion {
    var cantAcoplados = 1
    
    method peso() = 500 * cantAcoplados
    method cambiarCantAcoplados(NuevaCantidadAcoplados) {
        cantAcoplados = NuevaCantidadAcoplados
    }
}