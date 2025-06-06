object mozart{
    method puntos(unArtista) {unArtista.calidadMusical() * 2 }
}

object beethoven{
    var animo = 1
    method puntosPorcentajeDeOcupacion(unArtista){
        unArtista.ocupacion() / 20 * 100 / 10 
    }
    method animo(){}
}

object animo{
    var entusiasmo = 1
    method votosEnojado() = 1
    method votosEntusiasmado() = entusiasmo.between(1,5)
}

object taylorSwift{
   var banda = 1
   method calidadMusical() = banda * 5
   method ocupacion() = banda * 10
}

object morat{
    const banda = 4
    method calidadMusical() = banda * 2
    //method ocupacion() {largoDeLosNombres().sum()}
    method largoDeLosNombres() {return 4 * 5}
}

object silvioRodriguez{
    method calidadMusical() = 10
    method ocupacion() = 1
}
object badBunny{
    method calidadMusical() = 20
    method ocupacion() = 3

}

