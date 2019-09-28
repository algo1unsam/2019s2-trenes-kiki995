object trenes {

	const formacion = []

	method tren() {
		return formacion
	}

	method cargarVagon(vagon) {
		formacion.add(vagon)
	}

	method pesoliviano() {
		return formacion.map({ tren => tren.pesoMaximo() }).sum() < 2500
	}

	method velocidadMinima() {
		return formacion.min({ locomotoras => locomotoras.velocidadMaxima() })
	}

	method esEficiente() {
		return formacion.all({ locomotoras => locomotoras.pesoMaximo() }) >= (locomotoras.pesoMaximo() * 5)
	}

	method puedeMoverse() {
		return ( (self.arrastreUtilTotalDeSusLocomotoras()) >= (self.pesoMaximototalDeLosVagones()))
	}

	method pesoMaximototalDeLosVagones() {
		return formacion.sum({ vagones => vagones.pesoMaximo() })
	}

	method arrastreUtilTotalDeSusLocomotoras() {
		return formacion.sum({ locomotoras => locomotoras.arrastreUtil() })
	}

}

class Locomotoras {

	var property peso
	var property pesoMaximo
	var property velocidadMaxima

	method arrastreUtil() {
		return (pesoMaximo - peso)
	}


}

class VagonesDePasajeros {

	var property largo
	var property ancho

	method puedeTransportar() {
		if (self.ancho() < 2.5) {
			return (self.largo() * 8)
		} else {
			return (self.largo() * 10)
		}
	}

	method pesoMaximo() {
		return (self.puedeTransportar() * 80)
	}

}

class VagonesDeCarga {

	var property cargaMaxima
	var property ancho

	method pesoMaximo() {
		return (self.cargaMaxima() + 160)
	}

}

class Deposito {

	var property formaciones
	var property locomotoras

}

