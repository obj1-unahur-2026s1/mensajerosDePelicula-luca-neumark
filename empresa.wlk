object empresaPaqueteria {
    const property mensajeros = []
    const property pendientes = []
    const property enviados = []

    method contratarMensajero(mensajero) {mensajeros.add(mensajero)}
    method despedirMensajero(mensajero) {mensajeros.remove(mensajero)}
    method despedirATodos() {mensajeros.clear()}
    method esGrande() = mensajeros.size() > 2
    method puedeEntregarElPrimerEmpleado(destino, paquete) = paquete.puedeSerEntregado(mensajeros.first(), destino)
    method ultimoMensajero() = mensajeros.last()
    method pesoDelUltimoMensajero() = ultimoMensajero().peso()
    method puedeSerEntregadoPorAlgunMensajero(destino, paquete) = mensajeros.any({m => m.puedeLlevarA(destino, paquete)})
    method mensajerosCapacesDeEntregar(destino, paquete) = mensajeros.filter({m => m.puedeLlevarA(destino, paquete)}) 
    method sobrepeso() = mensajeros.sum({m => m.peso()}) / mensajeros.size() > 500
    method enviarPaquete(destino, paquete) {
        if (self.puedeSerEntregadoPorAlgunMensajero(destino, paquete)){
            const mensajero = self.mensajerosCapacesDeEntregar(destino, paquete).anyOne()
            enviados.add(paquete)
        } else {
            pendientes.add(paquete)
        }
    }
    method facturacionDeLaEmpresa() = enviados.sum({p => p.precio()})
    method enviarTodos(destino, paquetes) {
        paquetes.forEach({p => self.enviarPaquete(destino, p)})
    }
    method enviarPaquetePendienteMasCaro(destino) {
        const masCaro = pendientes.max({p => p.precio()})
        pendientes.remove(masCaro)
        self.enviarPaquete(destino, masCaro)
    }
}