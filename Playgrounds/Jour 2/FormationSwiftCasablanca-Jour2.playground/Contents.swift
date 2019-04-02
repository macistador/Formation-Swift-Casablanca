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
 * -----  PARTIE 2 -------
 *
 */

import UIKit


//
// Les tableaux
//

var villes : Array<String> = ["Casablanca", "Rabat", "Fès", "Marrakech", "Tanger"]

villes[1] = "Autre"

//villes.insert("Encore une autre", at: 5)

// villes est de type [String] ou bien Array<String>
// qui sont strictement équivalents

//let element = villes.first

// Any
// AnyObject




//let uneVille = villes[0] // « Casablanca »
//villes.count // retourne 6
//
//let index = 0
//if index < villes.count {
//    let el = villes[index]
//}






//var fruits : [String] = []    // on créé un tableau de String vide
//fruits.insert("🍓", at: 0)    // on insère un élement à l'indice 0
//fruits.insert("🍏", at: 1)    // on insère un élement à l'indice 1
//fruits[1] = "🍍"              // on remplace l'élement à l'indice 1
//
//fruits.append("🍐")
//
//fruits.contains("🍓")
//
//let fruit = fruits.removeFirst()          // on retire le premier élement du tableau
//let fruits2 = fruits.dropFirst()
//
//print(fruits)                 // affiche ["🍍", "🍐"]






//let entiers = [4, 5, 6] + [5, 14, 9, 45]

//// entiers contient [4, 5, 6, 5, 14, 9, 45]
//

//
//for entier in entiers {
//    print(entier)
//}
//// Affiche 4, 5, 6, 5, 14, 9, 45









// ------------------------------------------------------------








//
// Les dictionnaires
//

//var individu = ["Nom": "Dupont", "Age": "42 ans", "Ville": "Casablanca"]
//individu["Ville"] = "Rabat"
//
//print( individu["Ville"]! ) // affiche "Rabat"
//
//for (cle, valeur) in individu {
//    print("L'attribut \(cle) contient la valeur \(valeur) ")
//}


// Affiche
//     L'attribut Nom contient la valeur Dupont
//     L'attribut Ville contient la valeur Rabat
//     L'attribut Age contient la valeur 42 ans








// ------------------------------------------------------------








//
// Les tuples
//

//let date = Date()
//
//var tuple: (String, Int, Date) = ("ee", 3, date)
//
//var personne: (nom: String, age: Int, dateDeNaissance: Date)
//
//
//personne = (nom: "Dupont", age: 42, dateDeNaissance: date)
//
//personne.0 = "Dup"
//personne.age = 15
//personne.
//
//print(personne) // affiche (nom: "Dup", age: 15, dateDeNaissance: 1980-10-04)


//typealias ActionsType = () -> ()
//// Router
//
//let actions = ...
//
//let viewController(navigationsActions: actions)
//
//
//// ViewController
//let nagationsActions : (showAccount: ActionsType, showList: ActionsType, showDetails: ActionsType)
//init(navigationsActions)
////...
//nagationsActions.showAccount()








// ------------------------------------------------------------










//
// Les optionnels
//

var entierOptionnel: Int? = 324      // Ceci est un entier optionnel
var entierPasOptionnel: Int = 4   // Ceci est un entier

//entierOptionnel = nil
//print(entierOptionnel)     // affiche nil
//entierPasOptionnel = 4
//entierOptionnel = entierPasOptionnel
//print(entierOptionnel)     // affiche Optional(4)
//entierPasOptionnel = nil   // provoque une erreur de compilation



//if entierOptionnel != nil {
//    print(entierOptionnel)
//    print("La variable contient une valeur")
//}







//
// L'optional binding
//

//if var entierOptionnel = entierOptionnel {
//    print(entierOptionnel)  // affiche 4
//    entierOptionnel = 3
//}
//
//entierOptionnel





//
// Force unwrap
//

//print(entierOptionnel!) // affiche 4






//
// L'optional binding avec Guard
//

//print(entierOptionnel)  // affiche 4
//
//entierOptionnel = nil
//
//guard let entierOptionnel = entierOptionnel else { fatalError() }
//
//
//print(entierOptionnel)  // affiche 4





//
// L'optional chaining
//


//var animal : String? = "Crocodile"
//
//let startsWithC = animal?.hasPrefix("C")
//
//print(startsWithC)





//
// Le Nil-coalescing operator
//

//class truc {
//
//    init() {
//        maVille = "ma ville"
//    }
//
//    var maVille: String
//
//
//    func setVille(_ ville: String?) {
//        maVille = ville ?? "Ville inconnue"
//    }
//
//}




// ------------------------------------------------------------









//
// Les classes
//
//
//class NomDeLaSuperClasse { /* ... */ }
//
//class ClassParente: NomDeLaSuperClasse { /* ... */ }


//


//final class MaClasse: ClassParente {
//    var nombre: Int
//
//    override init() {
//        self.nombre = 34
//        super.init()
//    }
//
//
//    func methode() {
//        self.nombre = 6
//    }
//}
//
//let instance = MaClasse()
//instance.nombre


//class AutreClass: MaClasse { }




//instance.nombre = 3
//instance.methode()




//final class MaClass {}








//
// Les structures
//
//struct MaStruct {
//    var nombre: Int
//    var nombre2: Int
//
//   func methode() { }
//}
//
//let instance = MaStruct(nombre: 5, nombre2: 55)
//instance.methode()







// ------------------------------------------------------------









//
// Value type VS Reference type
//

// Type valeur
//struct S { var data: Int = -1 }
//var a = S()
//var b = a                       // a est copié sur b
//a.data = 42                     // change a, pas b
//print("\(a.data), \(b.data)") // affiche "42, -1"
//
//
//
//
//// Type référence
//class C { var data: Int = -1 }
//var x = C()
//var y = x                       // y référence x
//x.data = 42                     // les changements sur x affecte y
//print("\(x.data), \(y.data)") // affiche "42, 42"








// ------------------------------------------------------------








//
// Les énumerations
//

//struct Constants {
//    static let buttonImage = ""
//    static let labelImage = ""
//}
//
//let dfd = Constants.buttonImage
//

enum Personnage {
    case guerrier(arme: String, armure: String)
    case princesse

    func arme() -> String {
        switch self {
        case .guerrier(arme: let arme, armure: _): return arme
        default: return "rien"
        }
    }
}




//let direction = Direction(rawValue: 2)
//let rawDirection = direction?.rawValue
//print(direction?.phrase())
//

//func methode(direction: Direction) {
//
//}
//
//func methode(direction: String) {
//
//}
//
//func methode(direction: Int? = 67) {
//
//}
//methode(direction: 3)
//
//methode(direction: nil)




//func naviguate(to direction: Direction) {
//
//    switch direction {
//    case .nord: break // on ne fait rien
//    case .est, .sud: print("On va à l'est ou au sud")
//    case .ouest: break
//    default: print("On va ailleurs")
//    }
//}







