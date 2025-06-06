import testFormula.*

object vortex{
    var nivelBateria = 100
    method añoDeFabricacion() = 1998
    method experienciaRequerida(unPiloto) {unPiloto.experiencia() >= 5}
    method puedeUsarse() {nivelBateria > 10}
    method esUsado(unPiloto) {
    if(unPiloto.puedeUsarlo(self) && unPiloto.puedeUsarse())  {
      nivelBateria = (nivelBateria-30).max(0)
      unPiloto.usarAuto(self)
    } 
    }  
    method experienciaQueOtorga() = 2   
    method recargaDeAuto(unTiempo) {nivelBateria = (nivelBateria + 40 * unTiempo).min(100)} 
}

object nebula{
    var nivelBateria = 100
    var modoConduccion = inicial
    method añoDeFabricacion() = 2009
    method experienciaRequerida(unPiloto) {unPiloto.experiencia() >= 3}
    method puedeUsarse() {nivelBateria > 20}
    method establecerModoConduccion(unModo) {modoConduccion = unModo} 
    method esUsado(unPiloto){
        if(unPiloto.puedeUsarlo(self) && unPiloto.puedeUsarse()){
            nivelBateria = (nivelBateria - modoConduccion.consumo()).max(0)
            unPiloto.usarAuto(self)
        }
    }
    method experienciaQueOtorga() {modoConduccion.experienciaQueOtorga()}
    method recargaDeAuto(unTiempo) {nivelBateria = (nivelBateria + 30 * unTiempo).min(100)} 
}

object inicial{
    method experiencia() = 0
    method consumo() = 10
}
object intermedio{
    method experiencia() = 2
    method consumo() = 20
}
object avanzado {
    method experiencia() = 5
    method consumo() = 35
}

object quantum {
  method añoFabricacion() = 2024
  method nivelExperienciaRequerido() = 0
  method experienciaQueOtorga()= 1
  method esUsado(unPiloto){
    unPiloto.usarAuto(self)
  }
  method puedeUsarse() = true
}

///////////PILOTOS/////////////

object kaelVarela{
    var experienciaInicial = 3
    var estaCansado = false
    const autosConducidos = []
    method usarAuto(unAuto){
        if(! estaCansado && self.puedeUsarlo(unAuto)){
            estaCansado = true
            autosConducidos.add(unAuto)
        }
    }
    method puedeUsarlo(unAuto) = unAuto.nivelExperienciaRequerido() >= self.experiencia()
    method experiencia() = experienciaInicial + autosConducidos.sum({a=>a.experienciaQueOtorga()})
    method aniosAutosConducidos() = autosConducidos.map({a=>a.añoDeFabricacion()})
    method dormir() {estaCansado = false}
    method condujoElAuto(unAuto) = autosConducidos.contains(unAuto)
    method estaFeliz(autos) = autos.asSet() == autosConducidos.asSet()
} 

object novaIshari{
    var experienciaInicial = 5
    const autosConducidos = []
    var ultimoAutoConducido = autosConducidos.last()
    method experiencia() = experienciaInicial
    method usarAuto(unAuto) {
        if(self.puedeUsarlo(unAuto)) {
            experienciaInicial = experienciaInicial + unAuto.experienciaQueOtorga()
    }
    }
    method puedeUsarlo(unAuto) = unAuto.nivelExperienciaRequerido() >= self.experiencia()
    method estaFeliz(autos) {ultimoAutoConducido.añoDeFabricacion() > 2000}
}

object axelDraven{
    var experienciaInicial = 0
    var autosConducidos = 0
    method usarAuto(unAuto) {
        if(self.puedeUsarlo(unAuto)){
            autosConducidos +=1
            experienciaInicial = experienciaInicial + unAuto.experienciaQueOtorga()
        }
    }
    method experiencia() = experienciaInicial
    method puedeUsarlo(unAuto) = autosConducidos < 5 && unAuto.añoDeFabricacion() > 2000
    method aumentaExperiencia() {self.experiencia() + autosConducidos.experienciaQueOtorga()}
    method estaFeliz(unAuto) = autosConducidos >= 1
    method cantidadAutosProbados() = autosConducidos
}

object formulaF{
    var autos = []
    var pilotos = []
    method agregarAutos(listaAutos) {autos.addAll(autos)}
    method agregarPilotos(listaPilotos) {pilotos.addAll(pilotos)}
    method usarAutoEnUnEntrenamiento(unAuto, unPiloto) {unAuto.esUsado(unPiloto)}
    method probarAutos(unPiloto) {autos.forEach({a=>a.esUsado(unPiloto)})}
    method promedioDeExperiencia() {pilotos.sum({p=>p.experiencia()}) / autos.size()}
    method pilotoConMayorExperiencia() {pilotos.max({p=> p.experiencia()})}
    method añosDeFabricacion() {autos.map({a=>a.añosDeFabricacion()})}
    method autosSinCondiciones() {autos.filter({a=>!a.puedeUsarse()})}
    method todosLosAutosEnCondiciones() {autos.all({a=>a.puedeUsarse()})}
    method unPilotoRealizado(unPiloto) {unPiloto.estaFeliz()}
}