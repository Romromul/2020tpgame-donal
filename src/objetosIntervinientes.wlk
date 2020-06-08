import wollok.game.*
import interface.*
import juego.*

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
    method mover1() {const x = 1.randomUpTo(game.width()).truncate(0)
        const y = 1.randomUpTo(game.height()).truncate(11) 
        position = game.at(x,y)
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

object bomba{
     method image() = "bomba1.png"

     method position() = game.at(donal.position().x().min(25),12)

     method teEncontro(donal) {
        donal.perder2()
    }
 }
// se cruzan los dolares con la bomba 
object doctor{
    var property position = game.at(5,5)
    method agregaElixirDeLaVida() = 1
    method image() = "doctor.png"
    method mover() {
        const x = 1.randomUpTo(game.width()).truncate(2)
        const y = 1.randomUpTo(game.height()).truncate(2) 
        position = game.at(x,y)
    }
        method teEncontro(donal) {
        donal.ganarElixir(self)
    }
}

