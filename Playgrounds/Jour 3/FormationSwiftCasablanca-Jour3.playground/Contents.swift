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
 * -----  PARTIE 3 -------
 *
 */

import UIKit


//
// Opérateur ternaire
//

let age = 20
//let estMajeur : Bool = age >= 18 ? true : false

//
//let isAlive = true
//let isWorking = true
//
//if isAlive && isWorking {
//
//}
//
//
//let estIlMajeur = age >= 18 ? "Oui il est majeur" : "non il est mineur"









// ------------------------------------------------------------








//
// Implicitly unwrapped optional
//


//var implicitlyUnwrappedOptionnel: Int!
//
//print(implicitlyUnwrappedOptionnel) // crash car il n'y a pas de valeur














//struct Router { func getRoute() {} }
//
//class Routable {
//    var router : Router! = nil
//
//    func setup(with router: Router) {
//        self.router = router
//
//        router.getRoute()
//    }
//}








// ------------------------------------------------------------









//
// Les types imbriqués
//

//struct Monde {
//
//    enum Continent {
//        case afrique
//        case europe
//    }
//
//    var continent: Continent
//
//
//    class Afrique {
//        struct Pays {
//            let capitale: String
//        }
//    }
//}
//
//class MondeBis {
//    var continent: Monde.Continent = .europe
//}

//let maroc = Monde.Afrique.Pays(capitale: "Rabat")

//let monde = Monde(continent: Monde.Continent.Afrique)
//let color = UIColor.red


// ------------------------------------------------------------








//
// Les extensions
//

//extension Int {
//    var carre: Int { return self * self }
//}
//
//let result = 5.carre




//extension Int {
//    func carre() -> Int {
//        return self * self
//    }
//}
//let result = 5.carre()



//final class MaClasse {
//    var nombre: Int
//    var autreChose: Int = 3
//    var encoreAutreChose: String = ""
//
//
//    init(nombre: Int) {
//        self.nombre = nombre
//    }
//}
//
//
//extension MaClasse: Equatable {
//    static func == (lhs: MaClasse, rhs: MaClasse) -> Bool {
//        return true
//    }
//}
//
//let maClasseA = MaClasse(nombre: 4)
//let maClasseB = MaClasse(nombre: 5)
//
//if maClasseA == maClasseB {
//    print("Condition réalisée")
//}
//
//
//class AutreClasse: Equatable {
//    var maClass: MaClasse
//
//    init(maClass: MaClasse) {
//        self.maClass = maClass
//    }
//
//    static func == (lhs: AutreClasse, rhs: AutreClasse) -> Bool {
//        return lhs.maClass == rhs.maClass
//    }
//
//}






// ------------------------------------------------------------










//
// Les protocoles
//

//protocol Mangeable {}
//
//protocol Consommable {
//    var quantité: Int { get set }
//    mutating func consommer()
//}
//
//extension Consommable {
//    mutating func consommer() {
//        while quantité > 0 {
//            print("Je consomme")
//            quantité -= 1
//        }
//    }
//}
//
//
//
//
//struct Boisson: Consommable {
//    var quantité: Int
//    var gout: String
//
//    func afficherGout() {
//
//    }
//}
//
//struct Plat: Consommable {
//    var quantité: Int
//}
//
//struct Repas {
//
//    var boisson: Consommable
//    let ingrediens: [Consommable]
//
//    mutating func manger() {
//        boisson.consommer()
//    }
//}
//
//let jusOrange = Boisson(quantité: 10, gout: "bon")
//let coca = Boisson(quantité: 2, gout: "pas mal")
//
//let tajine = Plat(quantité: 3)
//
//var repas = Repas(boisson: jusOrange, ingrediens: [jusOrange, coca, tajine])
//repas.manger()








//extension Consommable {
//    func consommer() {
//        quantité -= 1
//        print("Il rest une quantité de \(quantité)")
//    }
//}
//
//class Boisson: Consommable {
//    var quantité: Int
//
//    init(quantité: Int) {
//        self.quantité = quantité
//    }
//}
//
//let soda = Boisson(quantité: 10)
//soda.consommer() // Il rest une quantité de 9





//func utiliser(consommable: Consommable) {
//    consommable.consommer()
//}
//utiliser(consommable: soda)  // Il rest une quantité de 8
//
//// ou bien
//
//struct Nourriture {
//    var consommables: [Consommable]
//
//    func toutConsommer() {
//        consommables.forEach{ $0.consommer() }
//        // strictement équivalent à
//        consommables.forEach{ consommable in consommable.consommer() }
//    }
//}





protocol Personnage {
    var name: String { get }
}
protocol Guerrier: Personnage {
    var arme: String? { get set }
    func attack(_ guerrier: Guerrier)
}
extension Guerrier {
    func attack(_ guerrier: Guerrier) {
        print(name + " attaque " + guerrier.name)
    }
}

protocol CanCry {
    func cry()
}
extension CanCry {
    func cry() {
        print("Snif Snifff")
    }
}
extension CanCry where Self: Guerrier {
    func cry() {
        print("grrrhhhhh....")
    }
}

struct Orc: Guerrier, CanCry {
    var name: String
    var arme: String?
}

struct Knight: Personnage, Guerrier, CanCry {
    var name: String
    var arme: String?
}

struct Courtisan: Personnage, CanCry {
    var name: String
    var arme: String?
}

struct Princess: Personnage, CanCry {
    var name: String
}

let zorf = Orc(name: "Zorf", arme: "Épée")
let gorf = Orc(name: "Gorf", arme: "Épée")
let peach = Princess(name: "Peach")
let zelda = Knight(name: "Zelda", arme: "Épée magique")

zorf.attack(gorf) // affiche "Zorf attaque Gorf"
peach.cry()       // "Snif Snifff"
zelda.attack(gorf)
gorf.cry()
