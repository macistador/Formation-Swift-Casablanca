//
//  ApiServiceType.swift
//  FirstApp
//
//  Created by Michel-Andre Chirita on 28/03/2019.
//  Copyright © 2019 croamac. All rights reserved.
//

import Foundation

protocol ApiServiceType {
    var delegate: ApiServiceDelegate? { get set }
    func getCities()
    func getWeather(for city: City)
}

protocol ApiServiceDelegate: class {
    func didReceived(cities: [City])
    func didReceived(weather: CityWeather)
}
