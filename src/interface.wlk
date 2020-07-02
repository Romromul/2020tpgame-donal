import donal.*
import wollok.game.*
import extras.*

class CambiarEstado {

	method aparecer() {
		game.addVisual(self)
	}

	method desaparecer() {
		game.removeVisual(self)
	}

	method teEncontro() {
	}

}

object fin {

	method position() = game.at(8, 1)

	method image() = 'fin.png'

	method continuar() {
		game.onTick(700, "GRAVEDAD", { donal.caer(1)})
		donal.vida(3)
		donal.elixir(0)
		donal.dinero(0)
		donal.position(game.at(10, 10))
		donal.cantidadVida()
		donal.cantidadDolar()
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

object vida1 inherits CambiarEstado {

	method position() = game.at(24, 12)

	method image() = "corazon.png"

}

object vida2 inherits CambiarEstado {

	method position() = game.at(23, 12)

	method image() = "corazon.png"

}

object vida3 inherits CambiarEstado {

	method position() = game.at(22, 12)

	method image() = "corazon.png"

}

object elixir1 {

	method position() = game.at(23, 12)

	method image() = "corazon1.png"

	method teEncontro() {}

}

object elixir2 {

	method position() = game.at(23, 12)

	method image() = "corazon2.png"

	method teEncontro() {
	}

}

object elixir3 {

	method position() = game.at(22, 12)

	method image() = "corazon1.png"

	method teEncontro() {
	}

}

object elixir4 {

	method position() = game.at(22, 12)

	method image() = "corazon2.png"

	method teEncontro() {
	}

}

object cifra0 inherits CambiarEstado {

	method image() = string.nume(donal.dinero(), 0) + '.png'

	method position() = game.at(21, 11)

}

object cifra1 inherits CambiarEstado {

	method image() = string.nume(donal.dinero(), 1) + '.png'

	method position() = game.at(22, 11)

}

object cifra2 inherits CambiarEstado {

	method image() = string.nume(donal.dinero(), 2) + '.png'

	method position() = game.at(23, 11)

}

object cifra3 inherits CambiarEstado {

	method image() = string.nume(donal.dinero(), 3) + '.png'

	method position() = game.at(24, 11)

}

object signoPeso {

	method image() = "dolar.png"

	method position() = game.at(20, 11)

	method teEncontro() {}

}

object string {

	var numeString = ''

	method nume(numero, cifra) { // 2
		numeString = numero.toString()
		if ((numero < 10) and (numero > -1)) {
			if (cifra == 3) {
				return numeString
			} else {
				if (cifra == 2) {
					return 'dolar'
				} else {
					return 'nada'
				}
			}
		} else {
			if ((numero > -10) and (numero < 0)) {
				if (cifra == 3) {
					return numeString.charAt(1)
				} else {
					if (cifra == 2) {
						return 'menos'
					} else {
						if (cifra == 1) {
							return 'dolar'
						} else {
							return 'nada'
						}
					}
				}
			} else {
				if ((numero > 9) and (numero < 100)) {
					if (cifra == 3) {
						return numeString.charAt(1)
					} else {
						if (cifra == 2) {
							return numeString.charAt(0)
						} else {
							if (cifra == 1) {
								return 'dolar'
							} else {
								return 'nada'
							}
						}
					}
				} else {
					if ((numero < -9) and (numero > -100)) {
						if (cifra == 3) {
							return numeString.charAt(2)
						} else {
							if (cifra == 2) {
								return numeString.charAt(1)
							} else {
								if (cifra == 1) {
									return 'menos'
								} else {
									return 'dolar'
								}
							}
						}
					} else {
						if ((numero > 99) and (numero < 1000)) {
							if (cifra == 3) {
								return numeString.charAt(2)
							} else {
								if (cifra == 2) {
									return numeString.charAt(1)
								} else {
									if (cifra == 1) {
										return numeString.charAt(0)
									} else {
										return 'dolar'
									}
								}
							}
						} else {
							if (cifra == 3) {
								return numeString.charAt(3)
							} else {
								if (cifra == 2) {
									return numeString.charAt(2)
								} else {
									if (cifra == 1) {
										return numeString.charAt(1)
									} else {
										return 'menos'
									}
								}
							}
						}
					}
				}
			}
		}
	}

}

