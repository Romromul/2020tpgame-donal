import wollok.game.*

object donal {
    var property position = game.at(10,10)
    var property dinero = 0
    var property vida = 10
    
    method image() {
   		return if (self.position().y()==0)  
			"donalsito-rojo.png"
		else
		   	 "donalsito.png"	
    } 
    
    method move(nuevaPosicion) {
        self.position(nuevaPosicion)
    }
    
    method recoger(algo) {
        dinero = dinero + algo.dineroQueOtorga()
        self.cantidadDolar()
        dolar.mover()
        }
        
    method caer(altura){
        position = game.at(position.x().limitBetween(1.5,20), (position.y()-altura).limitBetween(0,10))
    }
    
    method cantidadDolar() {
    	game.say(self, "Tengo " + self.dinero() + " dolares!!")
    }
    
    method cantidadVida() {
    	game.say(self, "Tengo " + self.vida() + " vidas!!")
    }

    method perder() {
        game.say(jon, "PERDISTE EL MUNDO EXPLOTO!")
        self.terminar()
     }
   
        
    method quitar(algo) {
        dinero = dinero-algo.dineroQueleSaca()
        self.cantidadDolar()
        game.say(coreano, "PERDISTE DINERO, jajajaja")
    }
    
    method quitarVida(algo) {
        vida = vida-algo.vidaQueleSaca()
        game.say(coronavirus, "PERDISTE UNA VIDA, CUIDADO")
  		self.cantidadVida()
        coronavirus.mover()
        if (vida<0)
        	self.terminar()
    }
    
    method leSaco50yquedaendeuda(algo) {
        dinero=dinero-algo.leSaco50()
        game.say(chino,"Te dolio?")
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
     
     method position() = game.at(donal.position().x().min(13),0)

     method teEncontro(donal) {
        donal.perder()
    }
 }
 
 object coreano{
     var property position = game.at(11,5)
     
     method image() = "coreano.png"
     
     method dineroQueleSaca() = 1
     
     method teEncontro(donal) {
        donal.quitar(self)
    }
 }
 
object chino{
     var property position = game.at(12,6)
     
     method image() = "chino2.png"
     
     method leSaco50()=50
     
     method teEncontro(donal) {
        donal.leSaco50yquedaendeuda(self)
    }
}

object coronavirus{
    var property position = game.at(9,9)
    
    method vidaQueleSaca() = 1
    
    method image() = "coronavirus.png"

    method mover() {
         const x = 1.randomUpTo(game.width()).truncate(2)
        const y = 1.randomUpTo(game.height()).truncate(2) 
        position = game.at(x,y)
    }
    
    method teEncontro(donal) {
        donal.quitarVida(self)
    }
}
