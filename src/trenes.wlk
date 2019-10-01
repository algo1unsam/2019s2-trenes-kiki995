import objects.*

class Formacion {

	var vagones = []
	var property locomotoras = []

	method agregarVagon(vagon) {
		vagones.add(vagon)
	}

	method sacarVagon(vagon) {
		vagones.remove(vagon)
	}

	method agregarLocomotora(locomotora) {
		locomotoras.add(locomotora)
	}

	method sacarLocomotora(locomotora) {
		locomotoras.remove(locomotora)
	}

	// Punto 1 
	method cuantosLivianos() {
		return vagones.count{ vagon => vagon.peso() < 2500 }
	}

	// Punto 2
	method velocidadMaxima() {
		return locomotoras.min{ locomotora => locomotora.velocidad() }.velocidad()
	}

	// Punto 3
	method eficiente() {
		return locomotoras.all{ locomotora => locomotora.buenArrastre() }
	}

	// Punto 4
	method puedeMoverse() {
		return self.arrastreUtilTotal() > self.pesoTotalVagones()
	}

	method arrastreUtilTotal() {
		return locomotoras.sum{ locomotora => locomotora.arrastreUtil() }
	}

	method pesoTotalVagones() {
		return vagones.sum{ vagon => vagon.peso() }
	}

	// Punto 5
	method arrastreFaltante() {
		return (self.pesoTotalVagones() - self.arrastreUtilTotal()).max(0)
	}

	// Para el Punto 6
	method vagonMasPesado() {
		return vagones.max{ vagon => vagon.peso() }
	}

	// Para el Punto 7
	method compleja() {
		return self.cantidadUnidades() > 20 or self.pesoTotal() > 10000
	}

	method cantidadUnidades() {
		return (locomotoras.size() + vagones.size())
	}

	method pesoTotal() {
		return self.unidades().sum{ u => u.peso() }
	}

	//method unidades() = locomotoras + vagones // TODO o directamente locomotoras.size() + vagones.size() no se si tiene sentido armar una lista nueva

	// Para el Punto 8
	method completaArrastre(locomotora) {
		return locomotora.arrastreUtil() >= self.arrastreFaltante()
	}

}

