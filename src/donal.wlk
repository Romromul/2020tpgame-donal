import wollok.game.*
import interface.*
import extras.*

object donal { 
	
    var property position = game.at(10,10)
    var property image = "donalsito.png"	
    
    var property dinero = 0
    var property vida = 3
    var property elixir = 0
    var property cuarentena=false
     
    method move(nuevaPosicion) {
        self.position(nuevaPosicion)
    }
    
    method recoger(algo) {
        dinero = dinero + algo.dineroQueOtorga()
        self.cantidadDolar()
        dolar.mover()
        }
        
    method caer(altura){ 
        if (!cuarentena) {position = game.at(position.x().limitBetween(1.5,23), (position.y()-altura).limitBetween(0,11))}
    }
    
    method cantidadDolar() { 
    	if ((!game.hasVisual(signoPeso)) and (self.dinero()<-99)) 
    		{game.addVisual(signoPeso)}
    	else
    		{if ((game.hasVisual(signoPeso)) and (self.dinero()>-100)) {game.removeVisual(signoPeso)}}
    	
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
    	if (elixir==0){
    		if (game.hasVisual(elixir1)){game.removeVisual(elixir1)}
    		if (game.hasVisual(elixir2)){game.removeVisual(elixir2)}
    		if (game.hasVisual(elixir3)){game.removeVisual(elixir3)}
    		if (game.hasVisual(elixir4)){game.removeVisual(elixir4)}
    	}
    	
    	if (vida==3){
    		if (!game.hasVisual(vida1)) {vida1.aparecer()}
    		if (!game.hasVisual(vida2)) {vida2.aparecer()}
    		if (!game.hasVisual(vida3)) {vida3.aparecer()} 
    		if ( (game.hasVisual(elixir3)) and (game.hasVisual(elixir4)))
    		{game.removeVisual(elixir3) game.removeVisual(elixir4)} 	
    	}
    	
    	else {
    		if (vida==2) { 
    			if (game.hasVisual(vida3)) {vida3.desaparecer()}
    			if (!game.hasVisual(vida2)) {vida2.aparecer()}
    			if ( (game.hasVisual(elixir1)) and (game.hasVisual(elixir2)) ){
    			game.removeVisual(elixir1)
    			game.removeVisual(elixir2)
    			}
    			if (elixir==1){game.addVisual(elixir3)}
    			if (elixir==2){game.addVisual(elixir4)}
    		}
    		
    		else{
    			if (vida==1){
    				if (game.hasVisual(elixir3)){game.removeVisual(elixir3)}
    				if (game.hasVisual(elixir4)){game.removeVisual(elixir4)}
    				if (elixir==1){game.addVisual(elixir1)}
    				if (elixir==2){game.addVisual(elixir2)}
    			}
    			if ((vida==1) and (game.hasVisual(vida2))){vida2.desaparecer()}
    			
    			else {
    				if (vida==0) {vida1.desaparecer()}
    			}
    		}
    	}
    }
   
    method quitarVida(algo) {
       vida = vida-algo.vidaQueleSaca()
       if (algo == 'putin')
          {game.say(putin, "SUERTE PARA LA PROXIMA")}
       else
       	  {game.say(algo, "PERDISTE UNA VIDA, CUIDADO") coronavirus.mover()}
        
       if (vida<=0) {game.removeTickEvent("GRAVEDAD") game.addVisual(fin)}
        self.cantidadVida()
    }
    
     method quitarDinero(algo) {
        dinero = dinero-algo.dineroQueleSaca()
        self.cantidadDolar()
        game.say(algo, "Has perdido dolares")
     }
   
     method terminar() {   	
     	game.removeVisual(self)
        game.schedule(2000, {game.stop()})
     }
 
	 method ganarElixir(){
        if (vida<3) {elixir=elixir+1}
        doctor.mover()
        game.say(doctor, "ganaste un elixir para una nueva vida ")
     }
    
     method ganarVida(){
        if ((elixir==3) and (vida<3)) 
        	{vida=vida+1
        	  elixir=0
        }
     }
    
     method quitarElixir(){
    	elixir=0
    	self.cantidadVida()
    	game.say(africanosBailarines,"Perdiste elixir para obtener VIDA")
     }
    
    method ganarDinero(algo) {
    	dinero = dinero + algo.plata()
    	if(dinero==30){
    		if (!game.hasVisual(algo)) {algo.aparecer()}}
    		else  
    			{algo.desaparecer()}
    }
}



