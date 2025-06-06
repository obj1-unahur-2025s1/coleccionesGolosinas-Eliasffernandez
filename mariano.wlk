import golosinas.*

object mariano{
    const golosinas = []
    method comprar(unaGolosina) = golosinas.add(unaGolosina)
    method desechar(unaGolosina) = golosinas.remove(unaGolosina)
    method cantidadDeGolosinas() = golosinas.size()
    method tieneLaGolosina(unaGolosina) = golosinas.contains(unaGolosina)
    method probarGolosinas() {golosinas.forEach({golosinas => golosinas.mordisco()})}
    method hayGolosinaSinTacc() {golosinas.any({golosinas => golosinas.libreGluten()})}
    method preciosCuidados() {golosinas.all({golosinas => golosinas.precio() <= 10})}
    method golosinaDeSabor(unSabor) {golosinas.first({golosinas => golosinas.sabor() == unSabor})}
    method golosinasDeSabor(unSabor) {golosinas.filter({g=> golosinas.sabor() == unSabor})}
    method sabores() {golosinas.map({g=> golosinas.sabor()}).asSet()}
    method golosinaMasCara() {golosinas.max({g=> golosinas.precio()})}
    method pesoGolosina() {golosinas.sum({g=> golosinas.peso()})}

    method golosinasFaltantes(golosinasDeseadas) {return golosinasDeseadas.difference(golosinas)}
    
    method gustosFaltantes(gustosDeseados) {return gustosDeseados.filter({g => ! self.tieneGolosinaDeSabor(gustosDeseados)})}
    method tieneGolosinaDeSabor(unSabor) {
		return golosinas.any({g => golosinas.sabor() == unSabor})
	}

    method gastoEn(unSabor) {golosinas.sum({g=> golosinas.sabor() == unSabor})}
    method saborMasPopular() {return golosinas.max({g=> golosinas.sabor()})} //verificar
    method saborMasPesado() {return golosinas.max({g=> golosinas.peso()})}
    /*
    comproYDesecho(golosina): indica si Mariano primero compró, y después desechó, la golosina por la que se pregunta.
    Pista: agregar un nuevo atributo a mariano, tiene que memorizar una información extra.
    */
    method comproYDesecho(unaGolosina) {}
}   