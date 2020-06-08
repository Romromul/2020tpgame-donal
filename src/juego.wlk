import wollok.game.*
import interface.*
import objetosIntervinientes.*

object donal {
    var property position = game.at(10,10)
    var property dinero = 0
    var property vida = 3
    var property elixir = 0
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
        dolar.mover1()
        }
        
    method caer(altura){
        position = game.at(position.x().limitBetween(1.5,23), (position.y()-altura).limitBetween(0,11))
    }
    method perder1() {
        game.say(africanosBailarines, "PERDISTE EL MUNDO EXPLOTO Y VAMOS A BAILAR CON TU ATAUD!")
        game.removeTickEvent("GRAVEDAD")
        game.onTick(1000, "muerto", {self.terminar()})
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
        game.removeTickEvent("GRAVEDAD")
        game.onTick(1000, "muerto", {self.terminar()})
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
        game.schedule(2 * 1000 , {game.stop()})
    }
    method quitar1(algo) {
        dinero = dinero-algo.dineroQueleSaca1()
        self.cantidadDolar()
        game.say(africanosBailarines, "PERDISTE DINERO, jajajaja")
    }

method ganarElixir(algo){
           elixir=elixir+algo.agregaElixirDeLaVida()
        doctor.mover()
        game.say(doctor, "ganaste un elixir para una nueva vida")
    }
    method ganarVida(){
        if (elixir==3){return vida+1} else{return vida}
    }
 method perder2() {
        game.say(bomba, "PERDISTE EL MUNDO EXPLOTO!")
        game.removeTickEvent("GRAVEDAD")
        game.onTick(1000, "muerto", {self.terminar()})
     }
 
}



