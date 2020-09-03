import wollok.game.*
import interface.*
import extras.*
import donal.*

object config {

	method configuracionDeTeclas() {
		keyboard.up().onPressDo{ if (donal.moverse()) {
				donal.move(donal.position().up(1))
			}
		}
		keyboard.down().onPressDo{ if (donal.moverse()) {
				donal.move(donal.position().down(1))
			}
		}
		keyboard.left().onPressDo{ if (donal.moverse()) {
				donal.move(donal.position().left(1))
				donal.direccion("Izq")
				jon.direccion("Izq")
				bomba.direccion("Izq")
			}
		}
		keyboard.right().onPressDo{ if (donal.moverse()) {
				donal.move(donal.position().right(1))
				donal.direccion("Der")
				jon.direccion("Der")
				bomba.direccion("Der")
			}
		}
		keyboard.y().onPressDo{ if (game.hasVisual(fin)) {
				fin.continuar()
			}
		}
		keyboard.n().onPressDo{ if (game.hasVisual(fin)) {
				fin.terminar()
			}
		}
	}

	method colisiones() {
		game.onCollideDo(donal, { unPersonaje => unPersonaje.teEncontro()})
		game.onTick(500, "GRAVEDAD", {donal.caer()})
		game.schedule(1000, { game.sound("ambiente.mp3").play()
		game.onTick(149000, "musica", { game.sound("ambiente.mp3").play()})
		})
	}

}

