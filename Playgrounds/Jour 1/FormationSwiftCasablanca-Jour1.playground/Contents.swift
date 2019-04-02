/*
  ______                         _   _                _____         _  __ _
 |  ____|                       | | (_)              / ____|       (_)/ _| |
 | |__ ___  _ __ _ __ ___   __ _| |_ _  ___  _ __   | (_____      ___| |_| |_
 |  __/ _ \| '__| '_ ` _ \ / _` | __| |/ _ \| '_ \   \___ \ \ /\ / / |  _| __|
 | | | (_) | |  | | | | | | (_| | |_| | (_) | | | |  ____) \ V  V /| | | | |_
 |_|  \___/|_|  |_| |_| |_|\__,_|\__|_|\___/|_| |_| |_____/ \_/\_/ |_|_|  \__|


 *  Casablanca - Mars 2019
 *  Michel-André Chirita
 *
 * -----  PARTIE 1 -------
 *
 */


import UIKit


//
// Hello World
//

print("Hello, world!")














/* --- Mini-Challenge: Hello world ----

 - Afficher "Hello" et "world" sur 2 lignes

 - Indice 1: utiliser l'auto-completion de Xcode
 - Indice 2: "\n" représente un saut de ligne
 */






// ------------------------------------------------------------









//
// Commentaires
//

// Mon Commentaire

/// Documentation

/*
 Commentaire multi-ligne
 */







// ------------------------------------------------------------








//
// Variables et constantes
//

//var myVar : Int = 10
//let myConstant : Int = 42
//
//let text = "mon texte"


















// ------------------------------------------------------------










//
// Opérateurs de base
//

//let addition = 1 + 2 // addition contiendra alors 3
//let soustraction = 10 - 5 // soustraction contiendra alors 5
//let multiplication = 6 * 7 // multiplication contiendra alors 42
//let division = 100 / 10 // division contiendra alors 10

















/* --- Mini-Challenge: opérateurs de base ----

 - Créer une constante "A" de type entier, ayant pour valeur 33
 - Créer une autre constante "B" de type entier, ayant pour valeur 7
 - De quel type serait la constante qui aurait pour valeur la division de A par B ?

 */




// ------------------------------------------------------------







//
// Conditions
//

//let age = 20
//if age >= 18 {
//    print("Vous êtes majeur !")
//    // Exécutez ici tout ce que vous voulez pour une personne majeure !
//}
//
//let nationalite = ""
//
//if (age >= 21 && nationalite == "USA") || (age >= 18 && nationalite == "FR") {
//    print("Vous êtes majeur.")
//}













/* --- Mini-Challenge: Conditions ----

 - Comment exprimer la condition qui afficherai "Vous êtes mineur" ?

 */



// ------------------------------------------------------------







//
// Switch
//

//let note = 18
//if note == 10 {
//    print("Vous avez la moyenne, mais vous n'obtenez pas de mentions.")
//} else if note == 12 {
//    print("Vous avez obtenu la mention assez bien.")
//} else if note == 14 {
//    print("Vous avez obtenu la mention bien.")
//} else if note == 16 {
//    print("Vous avez obtenu la mention très bien.")
//} else if note == 18 {
//    print("Vous avez les félicitations du jury !")
//} else {
//    print("Navré, il faut avoir une de ces notes pour avoir une mention.")
//}









//switch note {
//case 10:
//    print("Vous avez la moyenne, mais vous n'obtenez pas de mentions.")
//case 12:
//    print("Vous avez obtenu la mention assez bien.")
//case 14:
//    print("Vous avez obtenu la mention bien.")
//case 16:
//    print("Vous avez obtenu la mention très bien.")
//case 18:
//    print("Vous avez les félicitations du jury !")
//default:
//    print("Navré, il faut avoir une de ces notes pour avoir une mention.")
//}
















/* --- Mini-Challenge: Switch ----

 - Comment exprimer la conditio du challenge précédent avec un switch ?

 */





//let age: Int = 20
//let nationnalite = "FR"
//
//switch (age, nationnalite) {
//case (18..., "FR"), (21, "US"): print("Vous êtes majeur")
//default: print("Vous êtes mineur")
//}


// ------------------------------------------------------------







//
// Boucles: while
//

//let condition = true
//
//while condition {
//    //  …
//}


//
// Boucles: repeat-while
//

//var iteration: Int = 1
//while iteration <= 1000 {
//    print("Iteration \(iteration)")
//    iteration += 1
//}
//
//repeat {
//    print("Iteration \(iteration)")
//    iteration += 1
//} while iteration <= 1000

//var iteration: Int


//
// Boucles: for... in...
//

//for iteration in 1...1000 {
//    print("Iteration \(iteration)")
//}
















/* --- Mini-Challenge: Boucles ----

 - Créer une variable de type chaine de caractères, contenant une phrase
 - Itérer sur cette variable afin d'en retirer les caractères "a" et "e"
 - Afficher le résultat

 */

//let text = "mon texte"
//
//for char in text {
//    if "a"..."e" ~= char { print("OK")}
//
//    if case "a"..."e" = char { print("OUI")}
//}




// ------------------------------------------------------------








//
// Les fonctions
//

//func nomDeLaFonction() { /* ... */ }
//nomDeLaFonction()





//typealias MonType = Int
//
//func nomDeLaFonction(monParametre: MonType) {
//    monParametre // ...
//}
//
//let parametre = MonType()
//nomDeLaFonction(monParametre: parametre)




//func nomDeLaFonction() -> MonType { return MonType() }
//let valeurDeRetour = nomDeLaFonction()
//
//struct Fruit {}
//
//func manger(_ fruit: Fruit) { /* ... */ }
//let fruit = Fruit()
//manger(fruit)




//func manger(un fruit: Fruit) {
//    // ...
//}
//manger(un: fruit)















/* --- Mini-Challenge: Functions ----

 - Créer une fonction, appelée "check"
 - qui prend en paramétres un entier "value" et retourne une chaine de caractères
 - Si value est négatif ou zéro, retourner "La valeure est négative"
 - Sinon retourner "Ceci est un entier positif: [value]"

*/



// ------------------------------------------------------------







//
// Closures
//

//{ (parametres) -> MonType in
//    // Instructions
//}



//func premierPlusGrandQueDeuxieme(nb1: Int, nb2: Int) -> Bool {
//    return nb1 > nb2
//}
//func maFonction(maFonctionParametre: (Int, Int) -> Bool) {
//    if maFonctionParametre(4, 3) {
//        print("Condition validée.")
//    }
//}
//maFonction(maFonctionParametre: premierPlusGrandQueDeuxieme)
//// Affichera "Condition validée"






//func maFonction(closure: ()->()) { }
//
//
//maFonction(closure: { /* ... */  } )
//
//
//maFonction() { /* ... */ }














/* --- Mini-Challenge: Closures ----

 - Créer une closure qui prend un entier en paramétre et affiche "Le résultat est [valeur]"
 - Créer une fonction "multiplier" qui prend 2 entiers en paramétres
   et une closure sans paramétres ni valeur de retour.
 - Multiplier les 2 entiers et appeller la closure avec le résultat
 - Créer une deuxième fonction identique mais qui additionne les 2 entiers
 - Appeller les fonctions avec des la closure créé au début

 */
