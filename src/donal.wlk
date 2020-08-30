import wollok.game.*
import interface.*
import extras.*

object donal inherits Personaje (position = new Position(x = 10, y = 10), image = "donalsito.png") {

	var property dinero = 0
	var property vidas = 3
	var property estatico = false

	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}

	method colisionarCon(unPersonaje) {
		dinero = dinero + unPersonaje.dineroQueLeOtorga()
		dolar.mover()
	}

	method caer(altura) {
		if (!estatico) {
			self.position(new Position(x = self.position().x().limitBetween(1.5, 23), y = (self.position().y() - altura).limitBetween(0, 11)))
		}
	}

	method quitarVida(unPersonaje) {
		vidas = vidas - unPersonaje.vidaQueleSaca()
		if (unPersonaje == 'putin') {
			game.say(putin, "SUERTE PARA LA PROXIMA")
		} else {
			game.say(unPersonaje, "PERDISTE UNA VIDA, CUIDADO")
			coronavirus.mover()
		}
		if (vidas <= 0) {
			game.removeTickEvent("GRAVEDAD")
			game.addVisual(fin)
		}
	}

	method quitarDinero(unPersonaje) {
		dinero = (dinero - unPersonaje.dineroQueLeQuita()).max(0)
		game.say(unPersonaje, "Has perdido dolares")
	}

	method terminar() {
		game.removeVisual(self)
		game.schedule(2000, { game.stop()})
	}

	method ganarDinero(unPersonaje) {
		dinero = dinero + unPersonaje.dineroQueLeOtorga()
		if (dinero == 30) {
			if (!game.hasVisual(unPersonaje)) {
				unPersonaje.aparecer()
			}
		} else {
			unPersonaje.desaparecer()
		}
	}

}

