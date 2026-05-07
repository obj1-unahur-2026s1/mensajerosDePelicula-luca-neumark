import paquetes.*
import destinos.*
import transportes.*


object roberto {
    var transporte = bici
    method pesoPropio() = 90
    method peso() = self.pesoPropio() + transporte.peso()
    method puedeLlamar() = false
    method cambiarTransporte(transporteNuevo) {
      transporte = transporteNuevo
    }
    method puedeLlevarA(destino) = destino.dejaPasarA(self) and paquete.estaPago()
}


object neo {
    var credito = 20
    method peso() = 0
    method puedeLlamar() = credito > 0
    method cargarCredito(nuevoCredito) {
        credito += nuevoCredito
    }
    method puedeLlevarA(destino) = destino.dejaPasarA(self) and paquete.estaPago()
}


object chuck {
    method peso() = 80
    method puedeLlamar() = true
    method puedeLlevarA(destino) = destino.dejaPasarA(self) and paquete.estaPago()
}


object empresaPaqueteria {
    const mensajeros = []
    method contratarMensajero(mensajero) {mensajeros.add(mensajero)}
    method despedirMensajero(mensajero) {mensajeros.remove(mensajero)}
    method despedirATodos() {mensajeros.clear()}
    method esGrande() = mensajeros.size() > 2
    method puedeEntregarElPrimerEmpleado(destino) = paquete.puedeSerEntregado(mensajeros.first(), destino)
    method ultimoMensajero() = mensajeros.last()
    method pesoDelUltimoMensajero() = ultimoMensajero().peso()
}

