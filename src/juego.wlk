import wollok.game.*

object donal {
	var property position = game.at(10,10)
	var property dinero = 0
	method image() = "donalsito.png"
	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}	
	method recoger(algo) {
		dinero = dinero + algo.dineroQueOtorga()
		dolar.mover()
			}
	method caer(altura){
		position = game.at(position.x(), 0.max(position.y()- altura))
	}	
	
	method perder() {
		game.say(jon, "PERDISTE!")
		self.terminar()
		}
		
	method ganar() {
		game.say(self, "GANE!")
		self.terminar()
	}
	method terminar() {
		game.removeTickEvent("GRAVEDAD")
		game.schedule(2 * 1000 , {game.stop()})
	}
}
object dolar {
	var property position = game.at(1,1)
	method image() = "dolarr.png"
	method dineroQueOtorga() = 1
	
	method mover() {const x = 1.randomUpTo(game.width()).truncate(0)
		const y = 1.randomUpTo(game.height()).truncate(0) 
		position = game.at(x,y)
		}
		
	method teEncontro(donal) {
		donal.recoger(self)
	}
	method estaConJon() {
		return position == jon.position()
	}
	
	
 }
 
 object jon {
 	
 	method image() = "jon.png"
 	method position() = game.at(donal.position().x(),0)
 	
 	method teEncontro(donal) {
		donal.perder()
	}
 }
