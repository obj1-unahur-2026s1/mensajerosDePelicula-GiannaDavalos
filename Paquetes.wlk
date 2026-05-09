object paqueteOriginal {
	var estaPago = false
	var destino = laMatrix
	
	method estaPago() = estaPago
	method estaPago(booleano) { estaPago = booleano }
	
	method destino() = destino
	method destino(unDestino) { destino = unDestino }
	
	method precio() = 50
	
	method puedeSerEntregadoPor(mensajero) {
		return estaPago and destino.puedePasar(mensajero)
	}
}

object paquetito {
	method puedeSerEntregadoPor(mensajero) = true
	method precio() = 0
}

object paquetonViajero {
	var destinos = []
	var pagoAcumulado = 0
	
	method destinos() = destinos
	method agregarDestino(unDestino) { destinos.add(unDestino) }
	
	method precio() = destinos.size() * 100
	method pagar(monto) { pagoAcumulado += monto }
	method estaTotalmentePago() = pagoAcumulado >= self.precio()

	method puedeSerEntregadoPor(mensajero) {
		return self.estaTotalmentePago() and destinos.all({ d => d.puedePasar(mensajero) })
	}
}