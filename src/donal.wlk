import wollok.game.*
import interface.*
import extras.*

object donal inherits Visual (position = new Position(x = 10, y = 10)) {

	var property dinero = 0
	var property vidas = 3
	var property estatico = false
	var property direccion = "Der"
	
	override method image() = "donalsito" + direccion + ".png" 
	
	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}

	method colisionarCon(personajeQueDaDinero) {
		dinero = (dinero + personajeQueDaDinero.dineroQueLeOtorga()).min(999)
	}

	method caer() {
		if (!estatico) {
			self.position(new Position(x = self.position().x().limitBetween(1.5, 23), y = (self.position().y() - 1).limitBetween(0, 11)))
		}
	}
	
	method moverse(){
		return !estatico and !game.hasVisual(fin)
	}
}