import wollok.game.*
import interface.*
import donal.*

class Personaje {

	var property position
	var property image

	method teEncontro() {
	}

}

class DanDinero inherits Personaje {

	var property dineroQueLeOtorga = 22

	override method teEncontro() {
		donal.ganarDinero(self)
	}

	method aparecer() {
		game.addVisual(self)
	}

	method desaparecer() {
		game.removeVisual(self)
	}

}

object torreTrump inherits DanDinero (position = new Position(x = 4, y = 6), image = "torre_trump.png") {

}

object bolsonaro inherits DanDinero (position = new Position(x = 8, y = 4), image = "bolsonaro.png") {

}

object britanico inherits DanDinero (position = new Position(x = 11, y = 8), image = "britanico.png") {

}

class SacanDinero inherits Personaje {

	var property dineroQueLeQuita = 10

	override method teEncontro() {
		donal.quitarDinero(self)
	}

}

object coreano inherits SacanDinero (position = new Position(x = 19, y = 6), image = "coreano.png") {

}

object chino inherits SacanDinero (position = new Position(x = 19, y = 8), image = "chino2.png") {

}

class Mortal inherits Personaje {

	override method teEncontro() {
		game.removeTickEvent("GRAVEDAD")
		game.addVisual(fin)
	}

}

object jon inherits Mortal (image = "jon.png") {

	override method position() = new Position(x = donal.position().x().min(25), y = 0)
}

object bomba inherits Mortal (image = "bombaDer.png") {

	override method position() = new Position(x = donal.position().x().min(24), y = 12)
}

class Paralizador inherits Personaje {

	const tiempo

	override method teEncontro() {
		donal.estatico(true)
		game.schedule(tiempo, { donal.estatico(false)})
		game.say(self, "Entraste en cuarentena")
	}

}

object muro inherits Paralizador (position = new Position(x = 5, y = 5), image = "muroEEUUyMEX.png", tiempo = 5000) {

}

object alberto inherits Paralizador (position = new Position(x = 8, y = 2), image = "alberto.png", tiempo = 3000) {

}

object dolar inherits DanDinero (position = new Position(x = 1, y = 1), image = "dolarr.png") {

	method mover() {
		const x = 1.randomUpTo(game.width().min(24)).truncate(0)
		const y = 1.randomUpTo(game.height().min(12)).truncate(0)
		position = game.at(x, y)
	}

	override method teEncontro() {
		donal.colisionarCon(self)
	}

}

class QuitanVida inherits Personaje {

	method vidaQueleSaca() = 1

	override method teEncontro() {
		donal.quitarVida(self)
	}

}

object putin inherits QuitanVida (position = new Position(x = 15, y = 8), image = "putin.png") {

}

object africanosBailarines inherits QuitanVida (position = new Position(x = 13, y = 5), image = "africanosQueBailan1.png") {

}

object coronavirus inherits QuitanVida (position = new Position(x = 9, y = 9), image = "coronavirus.png") {

	method mover() {
		const x = 1.randomUpTo(game.width()).truncate(0)
		const y = 1.randomUpTo(game.height() - 1).truncate(0)
		position = game.at(x, y)
	}

}

object doctor inherits Personaje (position = new Position(x = 7, y = 7), image = "doctor.png") {

	method mover() {
		const x = 1.randomUpTo(game.width()).truncate(2)
		const y = 1.randomUpTo(game.height() - 1).truncate(2)
		position = game.at(x, y)
	}

	method darVida() {
		if (donal.vidas() < 3) {
			donal.vidas(donal.vidas() + 0.5)
			game.say(self, "ganaste vida")
		} else {
			game.say(self, "Tenes más vida que Mirtha")
		}
		self.mover()
	}

	override method teEncontro() {
		self.darVida()
	}

}

object angela inherits Personaje (position = new Position(x = 12, y = 7), image = "angelaMerkel.png") {

	override method teEncontro() {
		donal.dinero(0)
	}

}

