import donal.*
import wollok.game.*

object vida1{
	method position()=game.at(24,12)
	method image()="corazon.png"
	method aparecer(){
		game.addVisual(self)
		}
	method desaparecer(){
		game.removeVisual(self)
		}
	method teEncontro(donal) {}
}

object vida2{
	method position()=game.at(23,12)
	method image()="corazon.png"
	method aparecer(){
		game.addVisual(self)
		}
	method desaparecer(){
		game.removeVisual(self)
		}
		method teEncontro(donal) {}
}

object vida3{
	method position()=game.at(22,12)
	method image()="corazon.png"
	method aparecer(){
		game.addVisual(self)
		}
	method desaparecer(){
		game.removeVisual(self)
		}
		method teEncontro(donal) {}
}
object cifra0{
	method teEncontro(donal) {}
	method image()= string.nume(donal.dinero(),0) + '.png'
	method position()=game.at(21,11)
	method aparecer(){
		game.addVisual(self)
	}
	method desaparecer(){
		game.removeVisual(self)
	}
}
object cifra1{
	method teEncontro(donal) {}
	method image()= string.nume(donal.dinero(),1) + '.png'
	method position()=game.at(22,11)
	method aparecer(){
		game.addVisual(self)
	}
	method desaparecer(){
		game.removeVisual(self)
	}
}
object cifra2{
	method teEncontro(donal) {}
	method image()= string.nume(donal.dinero(),2) + '.png'
	method position()=game.at(23,11)
	method aparecer(){
		game.addVisual(self)
	}
	method desaparecer(){
		game.removeVisual(self)
	}
}
object cifra3{
	method teEncontro(donal) {}
	method image()= string.nume(donal.dinero(),3) + '.png'
	method position()=game.at(24,11)
	method aparecer(){
		game.addVisual(self)
	}
	method desaparecer(){
		game.removeVisual(self)
	}
}
object signoPeso{
	method teEncontro(donal) {}
	method image()="dolar.png"
	method position()=game.at(20,11)
}

object string{ // 1
	var numeString=''
	method nume(numero,cifra){ //2
		numeString=numero.toString()
		if ((numero<10) and (numero>-1)){    
											if (cifra==3){return numeString}
											else {
												if (cifra==2){return 'dolar'}
												else {return 'nada'}
											}
		}
		else{//6
				if ((numero>-10) and (numero<0)){
						if (cifra==3) {return numeString.charAt(1)}
						else{
							if (cifra==2) {return 'menos'}
							else  {
									if (cifra==1) {return 'dolar'}
									else {return 'nada'}
							}
						}
				}
				else{//7
					if ((numero>9) and (numero<100)){
						if (cifra==3){return numeString.charAt(1)}
						else{
							if (cifra==2){return numeString.charAt(0)}
							else{
								if (cifra==1){return 'dolar'}
								else{return 'nada'}
							}
						}
					}
					else{//5
						if ((numero<-9) and (numero>-100)){
							if (cifra==3){return numeString.charAt(2)}
							else{
								if (cifra==2) {return numeString.charAt(1)}
								else{
									if (cifra==1){return 'menos'}
									else{return 'dolar'}
								}
							}
						}
						else{//4
							if ((numero>99) and (numero<1000)){
								if (cifra==3) {return numeString.charAt(2)}
								else{
									if (cifra==2) {return numeString.charAt(1)}
									else{
										if (cifra==1){return numeString.charAt(0)}
										else {return 'dolar'}
									}
								}
							}
							else{//3
								if (cifra==3) {return numeString.charAt(3)}
								else{
									if (cifra==2) {return numeString.charAt(2)}
									else{
										if (cifra==1) {return numeString.charAt(1)}
										else {return 'menos'}
									}
								}
							}//3
						}//4
					}//5
				}//7
			}//6
		} //2
} //1