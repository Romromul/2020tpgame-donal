import wollok.game.*
import interface.*
import extras.*
import donal.*

object config {
		
		method configuracionDeTeclas() {
    		keyboard.up().onPressDo { if (!donal.cuarentena() and  (!game.hasVisual(fin)))  {
    			donal.move(donal.position().up(1))
    		} }
    		keyboard.down().onPressDo { if (!donal.cuarentena() and  (!game.hasVisual(fin)))  {
    			donal.move(donal.position().down(1))
    		} }
    		keyboard.left().onPressDo { if (!donal.cuarentena() and  (!game.hasVisual(fin)))  {
    			donal.move(donal.position().left(1))
    			donal.image("donalsitoIzq.png")
    		} }
    		keyboard.right().onPressDo {if (!donal.cuarentena() and  (!game.hasVisual(fin)))  {
    			donal.move(donal.position().right(1))
    			donal.image("donalsito.png")
    		} }
    		keyboard.y().onPressDo{ if (game.hasVisual(fin)) {fin.continuar()} }
    		keyboard.n().onPressDo{ if (game.hasVisual(fin)) {donal.terminar()} }
		}
		
		method colisiones() {
			game.onCollideDo(donal, {algo => algo.teEncontro(donal)})
    		game.onTick(700, "GRAVEDAD", { donal.caer(1)})
    		game.schedule(1000,{ game.sound("ambiente.mp3").play() game.onTick(149000,"musica", {game.sound("ambiente.mp3").play()})})
    		
		}
}