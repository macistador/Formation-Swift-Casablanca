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
 * -----  PARTIE 5 -------
 *
 */

import UIKit


//
// Access control
//

public class ClassePublique {

    public func fonctionPublique() {
        fonctionFileprivate()
        fonctionPrivate()
    }

}

extension ClassePublique {

    fileprivate func fonctionFileprivate() {
        fonctionPrivate()
    }

    private func fonctionPrivate() {

    }

}


// open
// public
// internal (defaut)
// fileprivate
// private





// ------------------------------------------------------------








//
// Gestion des erreurs
//


enum NetworkError: Error {
    case noNetwork
    case serverError
    case accessDenied
    case unknown(details: String)
}





func getRemoteObjects() throws -> [Any] {

    // erreur dans l'appel au serveur...
    throw NetworkError.accessDenied
}



func loadObjects() {

    do {
        let objects3 = try getRemoteObjects()
        objects3 // ...

    }
    catch let error as NetworkError {
        print("Autre erreur réseau \(error)")
    }
    catch NetworkError.noNetwork {
        print("Pas de réseau")
    }
    catch {
        print("Autre erreur")
    }
}










// ------------------------------------------------------------












//
// Memory management
//


//class MaClass { }
//
//var variable1 : MaClass? = MaClass()
//print("Count variable1: \(CFGetRetainCount(variable1))")

//var variable2 = variable1
//print("Count variable1: \(CFGetRetainCount(variable1))")
//print("Count variable2: \(CFGetRetainCount(variable2))")

//weak var variable3 = variable2
//print("Count variable1: \(CFGetRetainCount(variable1))")
//print("Count variable2: \(CFGetRetainCount(variable2))")
//print("Count variable3: \(CFGetRetainCount(variable3))")

//variable1 = nil
//print("Count variable2: \(CFGetRetainCount(variable2))")
//print("Count variable3: \(CFGetRetainCount(variable3))")

//variable2 = nil
//print("Count variable3: \(CFGetRetainCount(variable3))")



// isolated island


//class MaClass {
//    var closure : ()->() = {}
//
//    func recursiveMethod() {
//        self.closure = {  //[weak self] in // [unowned self] in
//
//            let deadlineTime = DispatchTime.now() + .seconds(1)
//            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
//                self.recursiveMethod()
//            }
//        }
//
//        closure()
//        print("ça passe ici")
//    }
//}
//
//var maClass: MaClass? = MaClass()
//maClass?.recursiveMethod()
////maClass = nil






// ------------------------------------------------------------
