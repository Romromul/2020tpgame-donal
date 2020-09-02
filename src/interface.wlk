import donal.*
import wollok.game.*
import extras.*

object fin inherits Visual(position = new Position(x = 8, y = 1)) {

	override method image() {
		if (donal.dinero() >= 999) 
			return 'win.png' 
		else 
			return 'fin.png'
	}

	method continuar() {
		game.onTick(700, "GRAVEDAD", {donal.caer()})
		donal.vidas(3)
		donal.dinero(0)
		donal.position(game.at(10, 10))
		if (!game.hasVisual(torreTrump)) {
			game.addVisual(torreTrump)
		}
		if (!game.hasVisual(bolsonaro)) {
			game.addVisual(bolsonaro)
		}
		if (!game.hasVisual(britanico)) {
			game.addVisual(britanico)
		}
		dolar.position(game.at(1, 1))
		coronavirus.position(game.at(9, 9))
		doctor.position(game.at(7, 7))
		game.removeVisual(self)
	}

	method terminar() {
		game.schedule(900, {game.stop()})
	}

	method finDelJuego() {
		game.removeTickEvent("GRAVEDAD")
		game.addVisual(self)
	}

}

object vida inherits Visual(position = new Position(x=22,y=12)) { 

	override method image() = "corazon" + donal.vidas().toString() + ".png"

}

object unidad inherits Visual (position = new Position(x = 24, y = 11)) {

	override method image() = (donal.dinero() - (donal.dinero() / 10).truncate(0) * 10).toString() + ".png"

}

object decena inherits Visual (position = new Position(x = 23, y = 11)) {

	override method image() = if (donal.dinero() >= 100) {
		(((donal.dinero() - centena.c() * 100) / 10).truncate(0)).toString() + ".png"
	} else {
		(donal.dinero() / 10).truncate(0).toString() + ".png"
	}

}

object centena inherits Visual (position = new Position(x = 22, y = 11)) {

	override method image() = self.c().toString() + ".png"

	method c() = (donal.dinero() / 100).truncate(0)

}

const signoPeso = new Visual(position = new Position(x=21,y=11), image = "SignoPeso.png")
