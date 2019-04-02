//
//  Meteo.swift
//  FirstApp
//
//  Created by Michel-Andre Chirita on 26/03/2019.
//  Copyright © 2019 croamac. All rights reserved.
//

import Foundation

struct CityWeather: Codable {
    let main: Main?

    var celciusTemperature: Double? {
        guard let temperature = main?.temperature else { return nil }
        return round((temperature - 32) / 1.8)
    }
}

struct Main: Codable {
    let temperature: Double?

    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
    }
}

extension CityWeather {
    static func mock() -> CityWeather {
        let randomTemp = Double.random(in: 10...40)
        let main = Main(temperature: randomTemp)
        return CityWeather(main: main)
    }
}
