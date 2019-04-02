//
//  MockApiService.swift
//  FirstApp
//
//  Created by Michel-Andre Chirita on 28/03/2019.
//  Copyright © 2019 croamac. All rights reserved.
//

import Foundation

final class MockApiService: ApiServiceType {
    weak var delegate: ApiServiceDelegate?

    func getCities() {
        let cities = [City.mock(), City.mock(), City.mock()]
        delegate?.didReceived(cities: cities)
    }

    func getWeather(for city: City) {
        let weather = CityWeather.mock()
        delegate?.didReceived(weather: weather)
    }
}
