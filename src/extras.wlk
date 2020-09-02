import wollok.game.*
import interface.*
import donal.*

class Visual {

	var property position
	var property image

	method teEncontro() {}

	method mover() {
		const x = 1.randomUpTo(game.width()).truncate(0)
		const y = 1.randomUpTo(game.height() - 1).truncate(0)
		position = game.at(x, y)
	}	
}

class DanDinero inherits Visual {

	var property dineroQueLeOtorga 

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

const torreTrump = new DanDinero (
	position = new Position(x = 4, y = 6), 
	image = "torre_trump.png",
	dineroQueLeOtorga = 100
	)

const bolsonaro  = new DanDinero (
	position = new Position(x = 8, y = 4), 
	image = "bolsonaro.png",
	dineroQueLeOtorga = 25
	)

const britanico = new DanDinero (
	position = new Position(x = 11, y = 8), 
	image = "britanico.png",
	dineroQueLeOtorga = 50
	) 

class QuitanDinero inherits Visual {

	var property dineroQueLeQuita = 25

	override method teEncontro() {
		self.quitarDinero()
	}

	method quitarDinero() {
		donal.dinero((donal.dinero() - self.dineroQueLeQuita()).max(0))
		game.say(self, "Has perdido dolares")
	}

}

const coreano = new QuitanDinero (position = new Position(x = 19, y = 6), image = "coreano.png")

const chino = new QuitanDinero (position = new Position(x = 19, y = 8), image = "chino.png") 

class Mortal inherits Visual {

	override method teEncontro() {
		fin.finDelJuego()
	}

}

object jon inherits Mortal (image = "jonDer.png") {

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

const muro = new Paralizador (position = new Position(x = 5, y = 5), image = "muro.png", tiempo = 3000) 

const alberto = new Paralizador (position = new Position(x = 8, y = 2), image = "alberto.png", tiempo = 2000)

object dolar inherits DanDinero (
	position = new Position(x = 1, y = 1), 
	image = "dolar.png",
	dineroQueLeOtorga = 10
) {



	override method teEncontro() {
		self.comprobarSiGana()
		donal.colisionarCon(self)
		self.mover()
	}

}

class QuitanVida inherits Visual {


	override method teEncontro() {
		self.quitarVida()
	}

	method quitarVida() { 
		donal.vidas(donal.vidas() - 1)
		game.say(self,"PERDISTE UNA VIDA, CUIDADO")

		if (donal.vidas() == 0) {
			game.removeTickEvent("GRAVEDAD")
			game.addVisual(fin)
		}
	}

}

const putin = new QuitanVida (position = new Position(x = 15, y = 8), image = "putin.png")

const africanosBailarines = new QuitanVida (position = new Position(x = 13, y = 5), image = "africanos.png")

object coronavirus inherits QuitanVida (position = new Position(x = 9, y = 9), image = "coronavirus.png") {

	override method teEncontro() {
		self.quitarVida()
		self.mover()
	}

}

object doctor inherits Visual (position = new Position(x = 7, y = 7), image = "doctor.png") {
	
	method darVida() {
		if (donal.vidas() < 3) {
			donal.vidas(donal.vidas() + 0.5)
			game.say(self, "Ganaste vida")
		} else {
			game.say(self, "No podes tener mas de 3 vidas")
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