import wollok.game.*
import interface.*
import donal.*

class Visual {var property position var property image}

class DanDinero {method teEncontro(donal) {donal.ganarDinero(self)}}

class SacanDinero {method teEncontro(donal) {donal.quitarDinero(self)}}

class Mortales {
	 method teEncontro(donal) {
          game.removeTickEvent("GRAVEDAD")
          game.addVisual(fin)}
}

class Cuarentena { 

	method teEncontro(donal){
		donal.cuarentena(true)
		if (self == 'Muro'){
			game.say(self, "Entraste en Mexico")
			game.schedule(5000, {donal.cuarentena(false)}) }
		else
			{game.say(self, "Entraste en cuarentena")
			game.schedule(3000,{donal.cuarentena(false)})}
	}
}

object jon inherits Mortales { 
	var property image = "jon.png" 
	method position() = game.at(donal.position().x().min(25),0)
}

object bomba inherits Mortales { 	
     var property image = "bombaDer.png"
     method position() = game.at(donal.position().x().min(24),12)
 }

object dolar { 
	
    var property position = game.at(1,1)
    
    method image() = "dolarr.png"
    
    method dineroQueOtorga() = 1
    
    method mover() {
    	const x = 1.randomUpTo(game.width().min(24)).truncate(0)
        const y = 1.randomUpTo(game.height().min(12)).truncate(0) 
        position = game.at(x,y)
    }
    
    method teEncontro(donal) {
        donal.recoger(self)
    }
}
 
object coreano inherits SacanDinero { 
     
     var property position = game.at(19,6) 
     
     method image() = "coreano.png"
     
     method dineroQueleSaca() = 1    
}
 
object chino inherits SacanDinero { 
     
     var property position = game.at(19,8)
     
     method image() = "chino2.png"    
     
     method dineroQueleSaca()= 10       
}

object coronavirus {
	 
    var property position = game.at(9,9)    
    
    method vidaQueleSaca() = 1
   
    method image() = "coronavirus.png"
   
    method mover() {
        const x = 1.randomUpTo(game.width()).truncate(0)
        const y = 1.randomUpTo(game.height()-1).truncate(0) 
        position = game.at(x,y)
    }
    
    method teEncontro(donal) {donal.quitarVida(self)}
}

object putin { 
	
	method position()=game.at(15,8)
	
	method image()="putin.png"
	
	method vidaQueleSaca()=1
	
	method teEncontro(donal) {donal.quitarVida(self)}
}

object africanosBailarines { 
	
    var property position = game.at(13,5)  
    
    method elixirQueleSaca()=1
    
    method image() = "africanosQueBailan1.png"
    
    method teEncontro(donal) {donal.quitarElixir()}
}

object doctor { 
	
    var property position = game.at(7,7)
    
    method image() = "doctor.png"
    
    method mover() {
        const x = 1.randomUpTo(game.width()).truncate(2)
        const y = 1.randomUpTo(game.height()-1).truncate(2) 
        position = game.at(x,y)
    }
    
    method teEncontro(donal) {
        donal.ganarElixir()
        donal.ganarVida()
        donal.cantidadVida()
    }
}

object  torreTrump inherits DanDinero { 
	
    var property position = game.at(4,6)
    
    method image()= "torre_trump.png"
    
    method plata() = 30
    
    method aparecer(){game.addVisual(self)}
    
	method desaparecer(){game.removeVisual(self)}
}

object bolsonaro inherits DanDinero {
	
	method position()=game.at(8,4)
	
	method image()="bolsonaro.png"
    
    method plata() = 30
    
    method aparecer(){game.addVisual(self)}
    
	method desaparecer(){game.removeVisual(self)}
}



object muro inherits Cuarentena { 
	
	method position()=game.at(5,5)
	
	method image()="muroEEUUyMEX.png"
}

object alberto inherits Cuarentena { 
	
	method position()=game.at(8,2)
	
	method image()="alberto.png"
}

object angela { 
	
	method position()=game.at(12,7)
	
	method image()="angelaMerkel.png"
	
	method teEncontro(donal){donal.dinero(0)}
}

object britanico inherits DanDinero {
	
	method position()=game.at(11,8)
	
	method image()="britanico.png"
    
    method plata() = 30
    
    method aparecer(){game.addVisual(self)}
    
	method desaparecer(){game.removeVisual(self)}
}
