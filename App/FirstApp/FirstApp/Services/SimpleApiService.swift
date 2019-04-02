//
//  SimpleApiService.swift
//  FirstApp
//
//  Created by Michel-Andre Chirita on 28/03/2019.
//  Copyright © 2019 croamac. All rights reserved.
//

import Foundation


final class SimpleApiService: ApiServiceType {

    let apiKey = "&appid=b05520bf39cc2afdd3d422398266eb60"
    let unitKey = "&units=imperial"
    let apiBaseUrl = "https://api.openweathermap.org/data/2.5/"
    let apiCityKey = "weather?q="

    weak var delegate: ApiServiceDelegate?

    func getCities() {
        let cities = [City.mock(), City.mock(), City.mock()]
        delegate?.didReceived(cities: cities)
    }

    func getWeather(for city: City) {

        let cityName = city.name
        let url = apiURL(forCityName: cityName)

        getDataFromURL(url: url) { [weak self] data in
            guard let cityWeather = self?.createWeatherObjectWith(json: data) else { return }

            DispatchQueue.main.async {
                self?.delegate?.didReceived(weather: cityWeather)
            }
        }
    }
}

extension SimpleApiService {

    fileprivate func apiURL(forCityName cityName: String) -> URL? {
        return URL(string: apiBaseUrl + apiCityKey + cityName + apiKey + unitKey)
    }

    fileprivate func getDataFromURL(url: URL?, completionHandler: @escaping (Data?)->Void) {
        guard let url = url else { return }

        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else { return }
            completionHandler(data)
        }

        session.resume()
    }

    fileprivate func createWeatherObjectWith(json: Data?) -> CityWeather? {
        guard let json = json else { return nil }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let weather = try decoder.decode(CityWeather.self, from: json)
            return weather
        } catch {
            print("Error creating current weather from JSON because: \(error.localizedDescription)")
            return nil
        }
    }
}
