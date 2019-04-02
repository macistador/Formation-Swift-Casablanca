//
//  City.swift
//  FirstApp
//
//  Created by Michel-Andre Chirita on 26/03/2019.
//  Copyright © 2019 croamac. All rights reserved.
//

import Foundation

struct City {
    let name: String
    let photoName: String
}

extension City {
    static func mock() -> City {
        let ville = ["Rabat","Casablanca","Paris","Lyon"].randomElement()
        return City(name: ville!, photoName: ville!)
    }
}
