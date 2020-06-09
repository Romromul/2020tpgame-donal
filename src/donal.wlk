import wollok.game.*
import interface.*
import extras.*

object donal { //PERSONAJE PRINCIPAL
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
        }
        
    method caer(altura){ //GRAVEDAD
        position = game.at(position.x().limitBetween(1.5,23), (position.y()-altura).limitBetween(0,11))
    }
    
    method cantidadDolar() { 
    	if ((!game.hasVisual(signoPeso)) and (self.dinero()<-99)) {game.addVisual(signoPeso)}
    	else{
       		if ((game.hasVisual(signoPeso)) and (self.dinero()>-100)) {game.removeVisual(signoPeso)}       		
       		}
    	cifra0.desaparecer()
    	cifra1.desaparecer()
    	cifra2.desaparecer()
    	cifra3.desaparecer()
    	cifra0.aparecer()
    	cifra1.aparecer()
    	cifra2.aparecer()
    	cifra3.aparecer() 	
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
   
    method quitarVida(algo) {
        vida = vida-algo.vidaQueleSaca()
        game.say(coronavirus, "PERDISTE UNA VIDA, CUIDADO") 		
        coronavirus.mover()
        if (vida<=0)  {self.terminar()}
        self.cantidadVida()
    }
    
    method pierde10(algo) {
        dinero = dinero-algo.leSaco10()
        self.cantidadDolar()
        game.say(chino,"Has perdido 10 dolares")
    }
    
    
     method quitar(algo) {
        dinero = dinero-algo.dineroQueleSaca()
        self.cantidadDolar()
        game.say(coreano, "PERDISTE DINERO, jajajaja")
    }
       
     method terminar() {
     	game.removeTickEvent("GRAVEDAD")
     	game.addVisual(fin)
     	game.removeVisual(self)
        game.schedule(2000, {game.stop()}) 
    }
 
     // FALTA TERMINAR
//	method ganarElixir(algo){
//           elixir=elixir+algo.agregaElixirDeLaVida()
//        doctor.mover()
//        game.say(doctor, "ganaste un elixir para una nueva vida")
//    }
//    
//    method ganarVida(){
//        if (elixir==3){return vida+1} else{return vida}
//    }
 
}



