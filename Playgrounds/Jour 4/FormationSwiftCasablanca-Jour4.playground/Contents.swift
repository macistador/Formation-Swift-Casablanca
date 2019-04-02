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
 * -----  PARTIE 4 -------
 *
 */

import UIKit


//
// Le type casting
//


class Parent {}
class Enfant: Parent {}

let parent : Parent = Parent()
let enfant : Enfant = Enfant()




if enfant is Enfant { print("C'est bien un enfant") }
if enfant is Parent { print("C'est aussi un parent") }
if !(parent is Enfant) { print("parent n'est pas un Enfant") }




















//if let enfant = enfant as? Parent { print("Enfant est maintenant 'casté' en tant que Parent") }
//
//
//
//if let parent = parent as? Enfant { print("Mais parent ne peut être casté en tant que Enfant") }

//let resultat = parent as? Enfant



//let cousin = enfant as! Parent // cousin est de type Parent
//let oncle = parent as! Enfant // crash




//let any: Any = "Any peut contenir n'importe quoi"




//let anyObject: AnyObject = Parent() // AnyObject peut contenir n'importe quel objet

// ------------------------------------------------------------










//
// Getter & setter
//

struct TriangleEquilateral {
    var longueurArrete: Double

    var perimetre: Double {
        get {
            return 3.0 * longueurArrete
        }
        set {
            longueurArrete = newValue / 3.0
        }
    }
}

var triangle = TriangleEquilateral(longueurArrete: 10)

let perimetreOriginal = triangle.perimetre // 30


triangle.perimetre = 60


let nouvelleLongueurArrete = triangle.longueurArrete // 20








// ------------------------------------------------------------










//
// willSet / didSet
//

//class Person {}
//
//struct Voiture {
//    var conducteur: Person? {
//        willSet(newPerson) {
//            print("La nouvelle valeur \(newPerson) va être assignée")
//        }
//        didSet{
//            print("La nouvelle valeur \(conducteur) a été assignée")
//        }
//    }
//}
//
//
//var instance = Voiture(conducteur: Person())
//instance.conducteur = Person()







// ------------------------------------------------------------








//
// Propriété composées / "compound properties"
//

//var firstName: String = "Jean"
//var lastName: String = "Dupont"
//
//
//var fullName: String {
//    return firstName + " " + lastName
//}
//
//print(fullName) // "Jean Dupont"
//firstName = "Eric"
//print(fullName) // "Eric Dupont"







// ------------------------------------------------------------









//
// Propriétés définies par une closure
//

//var firstName: String = "Jean"
//var lastName: String = "Dupont"
//lazy var fullName: String = {
//    return firstName + " " + lastName
//}()
//
////print(fullName) // "Jean Dupont"
//firstName = "Eric"
//print(fullName) // "Jean Dupont"
//
//fullName = {
//    return firstName + " " + lastName
//}()
//
//print(fullName) // "Eric Dupont"






// ------------------------------------------------------------









//
// Lazy property
//

//struct MaStruct {
//    lazy var resultatCalcul: Int = {
//        //... calcul complexe
//        return 10435
//    }()
//}








