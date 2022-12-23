//
//  WeatherManager.swift
//  Clima
//
//  Created by Emir Alkal on 23.12.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(with model: WeatherModel)
}

class WeatherManager {
    private init() {}
    static let shared = WeatherManager()
    var delegate: WeatherManagerDelegate?

    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=a71c4410a8c4669adf5016a27f165b96&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession(configuration: .default).dataTask(with: URLRequest(url: url)) { [weak self] data, response, error in
            guard error == nil else { print(error!); return }
            guard let data else { return }
            guard let weatherModel = self?.parseJSON(weatherData: data) else { return }
            self?.delegate?.didUpdateWeather(with: weatherModel)
        }.resume()
        
        
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(Weather.self, from: weatherData) else { return nil }
        return WeatherModel(conditionId: result.weather[0].id, cityName: result.name, temperature: result.main.temp)
    }
}
