import donal.*
import wollok.game.*
import extras.*

object fin {

	method position() = game.at(8, 1)

	method image() = 'fin.png'

	method continuar() {
		game.onTick(700, "GRAVEDAD", { donal.caer(1)})
		donal.vidas(3)
		donal.dinero(0)
		donal.position(game.at(10, 10))

		if (!game.hasVisual(torreTrump)) {
			torreTrump.aparecer()
		}
		if (!game.hasVisual(bolsonaro)) {
			bolsonaro.aparecer()
		}
		if (!game.hasVisual(britanico)) {
			britanico.aparecer()
		}
		dolar.position(game.at(1, 1))
		coronavirus.position(game.at(9, 9))
		doctor.position(game.at(7, 7))
		game.removeVisual(self)
	}

}

object vida { 

	method image() = "corazon" + donal.vidas().toString() + ".png"

	method position() = game.at(22, 12)
	
	method teEncontro() {}
}

object unidad {

	method image() = self.u().toString() + ".png"

	method position() = game.at(24, 11)

	method teEncontro() {}
	
	method u() = (donal.dinero() - (donal.dinero()/10).truncate(0)*10)
	
}

object decena {

	method image() = if (donal.dinero()>=100)
						{(((donal.dinero() - centena.c()*100)/10).truncate(0)).toString() + ".png"}
					else {(donal.dinero()/10).truncate(0).toString() + ".png"}
	
	method position() = game.at(23, 11)

	method teEncontro() {}
}

object centena {

	method image() = self.c().toString() + ".png"

	method position() = game.at(22, 11)

	method teEncontro() {}
	
	method c() = (donal.dinero() / 100).truncate(0)
}

object signoPeso {

	method image() = "dolar.png"

	method position() = game.at(21, 11)

	method teEncontro() {}

}

