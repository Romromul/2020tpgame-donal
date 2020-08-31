import wollok.game.*
import interface.*
import extras.*
import donal.*

object config {

	method configuracionDeTeclas() {
		keyboard.up().onPressDo{ if (!donal.estatico() and (!game.hasVisual(fin))) {
				donal.move(donal.position().up(1))
			}
		}
		keyboard.down().onPressDo{ if (!donal.estatico() and (!game.hasVisual(fin))) {
				donal.move(donal.position().down(1))
			}
		}
		keyboard.left().onPressDo{ if (!donal.estatico() and (!game.hasVisual(fin))) {
				donal.move(donal.position().left(1))
				donal.image("donalsitoIzq.png")
				jon.image("jonIzq.png")
				bomba.image("bombaIzq.png")
			}
		}
		keyboard.right().onPressDo{ if (!donal.estatico() and (!game.hasVisual(fin))) {
				donal.move(donal.position().right(1))
				donal.image("donalsitoDer.png")
				jon.image("jonDer.png")
				bomba.image("bombaDer.png")
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

