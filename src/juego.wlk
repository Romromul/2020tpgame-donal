import wollok.game.*
import interface.*

object donal {
    var property position = game.at(10,10)
    var property dinero = 0
    var property vida = 3
    
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
        position = game.at(position.x().limitBetween(1.5,23), (position.y()-altura).limitBetween(0,11))
    }
    method perder1() {
        game.say(africanosBailarines, "PERDISTE EL MUNDO EXPLOTO Y VAMOS A BAILAR CON TU ATAUD!")
        self.terminar()
     }
    method cantidadDolar() {
    	cifra0.desaparecer()
    	cifra1.desaparecer()
    	cifra2.desaparecer()
    	cifra3.desaparecer()
    	cifra0.aparecer()
    	cifra1.aparecer()
    	cifra2.aparecer()
    	cifra3.aparecer() 	
    	//game.say(self, "Tengo " + self.dinero() + " dolares!!")
    }
    
    method cantidadVida() {
    	if (vida==3){
    		vida1.aparecer()
    		vida2.aparecer()
    		vida3.aparecer()    	
    	}
    	else{
    		if (vida==2) { vida3.desaparecer()	}
    		else{
    			if (vida==1)	{vida2.desaparecer()}
    			else{
    				vida1.desaparecer()
    			}
    		}
    	}
    }

    method perder() {
        game.say(jon, "PERDISTE EL MUNDO EXPLOTO!")
        game.schedule(1000, {game.sound("musiquita.mp3").play()})
        game.onTick(10000, "muerto", {self.terminar()})
     }
        
    method quitar(algo) {
        dinero = dinero-algo.dineroQueleSaca()
        self.cantidadDolar()
        game.say(coreano, "PERDISTE DINERO, jajajaja")
    }
    
    method quitarVida(algo) {
        vida = vida-algo.vidaQueleSaca()
        game.say(coronavirus, "PERDISTE UNA VIDA, CUIDADO") 		
        coronavirus.mover()
        if (vida<=0)  {self.terminar()}
        self.cantidadVida()
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
    method quitar1(algo) {
        dinero = dinero-algo.dineroQueleSaca1()
        self.cantidadDolar()
        game.say(africanosBailarines, "PERDISTE DINERO, jajajaja")
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
     
     method position() = game.at(donal.position().x().min(25),0)

     method teEncontro(donal) {
        donal.perder()
    }
 }
 
 object coreano{
     var property position = game.at(19,6)
     
     method image() = "coreano.png"
     
     method dineroQueleSaca() = 1
     
     method teEncontro(donal) {
        donal.quitar(self)
    }
 }
 
object chino{
     var property position = game.at(19,8)
     
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

object africanosBailarines{
    var property position = game.at(13,5)
     method image() = "africanosQueBailan1.png"
     method teEncontro(donal) {
        donal.perder1()
    }
}
object torreTrump{
    var property position = game.at(4,6)
     method image() = "torre_trump.png"
	method teEncontro(donal) {}
}

