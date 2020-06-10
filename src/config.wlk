import wollok.game.*
import interface.*
import extras.*
import donal.*

object config {
		
		method configuracionDeTeclas() {
			keyboard.h().onPressDo { game.say(donal, "Vamos por esos dolaritos!") }
    		keyboard.up().onPressDo { if (!donal.cuarentena()) {donal.move(donal.position().up(1))} }
    		keyboard.down().onPressDo { if (!donal.cuarentena()) {donal.move(donal.position().down(1))} }
    		keyboard.left().onPressDo { if (!donal.cuarentena()) {donal.move(donal.position().left(1))} }
    		keyboard.right().onPressDo {if (!donal.cuarentena()) { donal.move(donal.position().right(1))} }
    		keyboard.p().onPressDo{  game.say(donal, "Tengo" + " " +donal.dinero().toString()+" " + "dolares.") }
    		keyboard.v().onPressDo{  game.say(donal, "Tengo" + " " +donal.vida().toString()+" "+"vidas.") }
    		keyboard.e().onPressDo{  game.say(donal, "Tengo" + " " +donal.elixir().toString()+" "+"elixir.") }
		}
		
		method colisiones() {
			game.onCollideDo(donal, {algo => algo.teEncontro(donal)})
    		game.onTick(700, "GRAVEDAD", { donal.caer(1)})
    		game.schedule(700, {game.sound("ambiente.mp3").play()})
			}
}