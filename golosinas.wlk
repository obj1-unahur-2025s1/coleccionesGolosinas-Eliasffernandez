object frutilla { }
object chocolate { }
object vainilla { }
object naranja { }
object limon { }

object bombon { 
  const pesoInicial = 15
  method precio() = 5
  method peso(){ return pesoInicial}
  method sabor(){return frutilla}
  method libreGluten() {return true}
  method mordisco() = 0.max(self.peso() * 0.8) - 1
} 

object alfajor{
  var pesoInicial = 300
  method precio() = 12
  method peso() = pesoInicial
  method sabor(){return chocolate}
  method libreGluten() { return false }
  method mordisco(){ pesoInicial = pesoInicial * 0.8}
}

object caramelo {
  var pesoInicial = 5
  method precio() = 1
  method peso() {return pesoInicial}
  method sabor(){return frutilla}
  method  libreGluten() {return true}
  method mordisco() {pesoInicial = pesoInicial - 1}
}

object chupetin {
  var pesoInicial = 7
  method precio() = 2
  method peso()= pesoInicial
  method sabor(){return naranja}
  method libreGluten() {return true}
  method mordisco() {
    if(pesoInicial > 2) {
      pesoInicial=pesoInicial * 0.9
    }
  }
}    
object oblea{
  var pesoInicial = 250
  method precio() = 5
  method peso()= pesoInicial
  method sabor(){return vainilla}
  method libreGluten() { return false }
  method mordisco(){
    if(pesoInicial > 70){
      pesoInicial=pesoInicial *0.5
    }
    else{
      pesoInicial=pesoInicial *0.25
    }
  }
}

object chocolatin{
  var pesoInicial = 0
  var comido = 0
  method precio() {pesoInicial * 0.50}
  method pesoInicial(unPeso) {pesoInicial = unPeso}
  method peso() {return (pesoInicial-comido).max(0)}
  method libreGluten() { return false }
  method sabor(){return chocolate}
  method mordisco() {comido=comido - 2}
}

object golosinaBañada {
  var golosinaBase = {}
  var pesoBañado = 4
  method golosinaInterior(unaGolosina){golosinaBase = unaGolosina}
  method pesoBañado(unaGolosina) = golosinaBase.peso() + pesoBañado
  method precioBñado() = golosinaBase.precio() + 2
  method sabor(){golosinaBase.sabor()}
  method tieneGluten() = golosinaBase.libreGluten()
  method mordisco() {
    golosinaBase.recibeUnMordisco()
    pesoBañado = (pesoBañado -2).max(0)
  }
}

object pastillaTuttiFrutti {
  var libreDeGluten = true
	const sabores = [frutilla, chocolate, naranja]
	var saborActual = 0
	
	method mordisco() { saborActual += 1 }	
	method sabor() { return sabores.get(saborActual % 3) }	

	method precio() { return (if(self.libreGluten()) 7 else 10) }
	method peso() { return 5 }
	method libreGluten() { return libreDeGluten }	
	method libreGluten(valor) { libreDeGluten = valor }
}  