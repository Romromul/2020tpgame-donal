import wollok.game.*
import interface.*
import extras.*

object donal inherits Visual (position = new Position(x = 10, y = 10), image = "donalsito.png") {

	var property dinero = 0
	var property vidas = 3
	var property estatico = false

	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}

	method colisionarCon(unPersonaje) {
		dinero = (dinero + unPersonaje.dineroQueLeOtorga()).min(999)
	}

	method caer(altura) {
		if (!estatico) {
			self.position(new Position(x = self.position().x().limitBetween(1.5, 23), y = (self.position().y() - altura).limitBetween(0, 11)))
		}
	}

}