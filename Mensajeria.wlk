object mensajeria {
	var mensajeros = []
	var paquetesEnviados = []
	var paquetesPendientes = []

	method mensajeros() = mensajeros
	
	method contratar(alguien) { mensajeros.add(alguien) }
	method despedir(alguien) { mensajeros.remove(alguien) }
	method despedirATodos() { mensajeros.clear() }
	
	method esGrande() = mensajeros.size() > 2
	
	method puedeEntregarPrimero(paquete) {
		return paquete.puedeSerEntregadoPor(mensajeros.first())
	}
	
	method pesoDelUltimo() = mensajeros.last().peso()
	
	method puedeEntregarCualquiera(paquete) {
		return mensajeros.any({ m => paquete.puedeSerEntregadoPor(m) })
	}
	
	method mensajerosQuePuedenLlevar(paquete) {
		return mensajeros.filter({ m => paquete.puedeSerEntregadoPor(m) })
	}
	
	method tieneSobrepeso() {
		return (mensajeros.sum({ m => m.peso() }) / mensajeros.size()) > 500
	}
	
	method enviar(paquete) {
		if (self.puedeEntregarCualquiera(paquete)) {
			paquetesEnviados.add(paquete)
		} else {
			paquetesPendientes.add(paquete)
		}
	}
	
	method facturacion() = paquetesEnviados.sum({ p => p.precio() })
	
	method enviarLote(listaDePaquetes) {
		listaDePaquetes.forEach({ p => self.enviar(p) })
	}
	
	method enviarPendienteMasCaro() {
		if (not paquetesPendientes.isEmpty()) {
			const masCaro = paquetesPendientes.max({ p => p.precio() })
			if (self.puedeEntregarCualquiera(masCaro)) {
				paquetesPendientes.remove(masCaro)
				paquetesEnviados.add(masCaro)
			}
		}
	}
}