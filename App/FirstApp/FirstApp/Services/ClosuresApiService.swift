//
//  ApiService.swift
//  FirstApp
//
//  Created by Michel-Andre Chirita on 26/03/2019.
//  Copyright © 2019 croamac. All rights reserved.
//

import Foundation

typealias CitiesCompletionType = ([City]?) -> Void
typealias WeatherCompletionType = (CityWeather?) -> Void

protocol ApiServiceType {
    func getCities(completion: @escaping CitiesCompletionType)
    func getWeather(for cityName: String, completion: @escaping WeatherCompletionType)
}


final class ApiService: ApiServiceType {

    typealias DataCompletionType = (Data?) -> Void

    let apiKey = "&appid=b05520bf39cc2afdd3d422398266eb60"
    let unitKey = "&units=imperial"
    let apiBaseUrl = "https://api.openweathermap.org/data/2.5/"
    let apiCityKey = "weather?q="

    func getCities(completion: @escaping CitiesCompletionType) {
        let casablanca = City(name: "Casablanca", photoName: "casablanca")
        let paris = City(name: "Paris", photoName: "paris")
        let newYork = City(name: "New York", photoName: "newyork")
        completion([casablanca, paris, newYork])
    }


    func getWeather(for cityName: String, completion: @escaping WeatherCompletionType) {

        guard let encodedCityName = cityName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }

        let url = apiURL(for: encodedCityName)

        getDataFromURL(url: url) { data in
            let weather = self.createWeatherObjectWith(json: data)

            DispatchQueue.main.async {
                completion(weather)
            }
        }
    }
}

extension ApiService {

    fileprivate func apiURL(for cityName: String) -> URL? {
        return URL(string: apiBaseUrl + apiCityKey + cityName + apiKey + unitKey)
    }

    fileprivate func getDataFromURL(url: URL?, completion: @escaping DataCompletionType) {
        guard let url = url else { return }

        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else { return }

//            print("Response: \(response)")
            completion(data)
        }

        session.resume()
    }

    fileprivate func createWeatherObjectWith(json: Data?) -> CityWeather? {
        guard let json = json else { return nil }

//        do {
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//            let weather = try decoder.decode(CityWeather.self, from: json)
//            return weather
//        } catch {
//            print("Error creating current weather from JSON because: \(error.localizedDescription)")
//            return nil
//        }

        return CityWeather.mock()
    }

    //    enum ApiError: Error {
    //        case responseError
    //        case decodingError
    //    }
}
