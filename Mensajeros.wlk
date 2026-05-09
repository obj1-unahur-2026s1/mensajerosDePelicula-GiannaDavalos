object roberto {
  var transporte = bicicleta 
  var pesoPropio = 90
  var cantidadAcoplados = 1

  method pesoPropio() = pesoPropio
  method pesoPropio(unPeso) { pesoPropio = unPeso}

  method setTransporte(unTransporte) { transporte = unTransporte}
  method setAcoplados(unValor) { cantidadAcoplados = unValor}

  method peso(){
    if (transporte == bicicleta){
        return pesoPropio + 5
    }
    else {
        return pesoPropio + (cantidadAcoplados * 500)
    }
  }

  method puedeLlamar() = false
}

object bicicleta {}
object camion {}

object chuckNorris {
  method peso() = 80
  method puedeLlamar() = true
}

object neo {
  var tieneCredito = true

  method tieneCredito() = tieneCredito
  method tieneCredito(unValor) { tieneCredito = unValor}

  method peso() = 0
  method puedeLlamar() = tieneCredito
}
