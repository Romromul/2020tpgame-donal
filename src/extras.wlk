import wollok.game.*
import interface.*
import donal.*

class Visual {

	var property position
	var property image

	method teEncontro() {
	}

}

class DanDinero inherits Visual {

	var property dineroQueLeOtorga = 200

	override method teEncontro() {
		self.comprobarSiGana()
		self.darDinero()
	}

	method darDinero() {
		donal.dinero((donal.dinero() + self.dineroQueLeOtorga()).min(999))
		game.removeVisual(self)
	}

	method comprobarSiGana() {
		if ((donal.dinero() + self.dineroQueLeOtorga()) >= 999) {
			fin.finDelJuego()
		}
	}

}

object torreTrump inherits DanDinero (position = new Position(x = 4, y = 6), image = "torre_trump.png") {

}

object bolsonaro inherits DanDinero (position = new Position(x = 8, y = 4), image = "bolsonaro.png") {

}

object britanico inherits DanDinero (position = new Position(x = 11, y = 8), image = "britanico.png") {

}

class QuitanDinero inherits Visual {

	var property dineroQueLeQuita = 10

	override method teEncontro() {
		self.quitarDinero()
	}

	method quitarDinero() {
		donal.dinero((donal.dinero() - self.dineroQueLeQuita()).max(0))
		game.say(self, "Has perdido dolares")
	}

}

object coreano inherits QuitanDinero (position = new Position(x = 19, y = 6), image = "coreano.png") {

}

object chino inherits QuitanDinero (position = new Position(x = 19, y = 8), image = "chino2.png") {

}

class Mortal inherits Visual {

	override method teEncontro() {
		fin.finDelJuego()
	}

}

object jon inherits Mortal (image = "jon.png") {

	override method position() = new Position(x = donal.position().x().min(25), y = 0)

}

object bomba inherits Mortal (image = "bombaDer.png") {

	override method position() = new Position(x = donal.position().x().min(24), y = 12)

}

class Paralizador inherits Visual {

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
		self.comprobarSiGana()
		donal.colisionarCon(self)
		self.mover()
	}

}

class QuitanVida inherits Visual {

	method vidaQueleSaca() = 1

	override method teEncontro() {
		self.quitarVida()
	}

	method quitarVida() { // VER
		donal.vidas(donal.vidas() - self.vidaQueleSaca())
		if (self == 'putin') {
			game.say(putin, "SUERTE PARA LA PROXIMA")
		} else {
			game.say(self, "PERDISTE UNA VIDA, CUIDADO")
			coronavirus.mover()
		}
		if (donal.vidas() <= 0) {
			game.removeTickEvent("GRAVEDAD")
			game.addVisual(fin)
		}
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

object doctor inherits Visual (position = new Position(x = 7, y = 7), image = "doctor.png") {

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

object angela inherits Visual (position = new Position(x = 12, y = 7), image = "angelaMerkel.png") {

	override method teEncontro() {
		donal.dinero(0)
	}

}