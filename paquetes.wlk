object paquete{
    var estaPago = false
    method puedeSerEntregado(mensajero, destino) = mensajero.puedeLlevarA(destino) and estaPago
    method estaPago() = estaPago
    method serPagado() {estaPago = true}
}

object paquetito{
    method precio() = 0 
    method estaPago() = true 
    method puedeSerEntregado(mensajero, destino) = true
}

object paquetonViajero{
    const destinos = [1,2,3,4]
    var pago = 0

    method precio() = destinos.size() * 100

    method estaPago() = self.precio() == pago
    method serPagado() {pago = self.precio()}
    method serPagadoParcialmente(pesos) {pago += pesos}

    method agregarDestino(destino) {destinos.add(destino)}
    method puedeSerEntregado(mensajero, destino) = destinos.all({d => mensajero.puedeLlevarA(d)}) and self.estaPago()
}