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
}
object dolar {
	var property position = game.at(1,1)
	method image() = "dolarr.png"
	method dineroQueOtorga() = 1
	
	method mover() {const x = 0.randomUpTo(game.width()).truncate(0)
		const y = 0.randomUpTo(game.height()).truncate(0) 
		position = game.at(x,y)
		}
		
	method teEncontro(donal) {
		donal.recoger(self)
	}
 }
