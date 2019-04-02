//
//  PlistService.swift
//  FirstApp
//
//  Created by Michel-Andre Chirita on 28/03/2019.
//  Copyright © 2019 croamac. All rights reserved.
//

import Foundation

struct PlistService {

    static func getPlist(withName name: String) -> [Revue]?
    {
        if  let path = Bundle.main.path(forResource: name, ofType: "plist"),

            let fileData = FileManager.default.contents(atPath: path),

            let revues = try? PropertyListDecoder().decode([Revue].self, from: fileData)
        {
            return revues
        }

        return nil
    }
}
