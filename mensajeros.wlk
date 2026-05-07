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
    method puedeLlevarA(destino, paquete) = destino.dejaPasarA(self) and paquete.estaPago()
}


object neo {
    var credito = 20
    method peso() = 0
    method puedeLlamar() = credito > 0
    method cargarCredito(nuevoCredito) {
        credito += nuevoCredito
    }
    method puedeLlevarA(destino, paquete) = destino.dejaPasarA(self) and paquete.estaPago()
}


object chuck {
    method peso() = 80
    method puedeLlamar() = true
    method puedeLlevarA(destino, paquete) = destino.dejaPasarA(self) and paquete.estaPago()
}


//Mensajero agregado
object hermes {
    method peso() = 40
    method puedeLlamar() = true
    method puedeLlevarA(destino, paquete) = destino.dejaPasarA(self) and paquete.estaPago()
}




