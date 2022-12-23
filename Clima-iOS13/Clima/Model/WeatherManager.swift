//
//  WeatherManager.swift
//  Clima
//
//  Created by Emir Alkal on 23.12.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

class WeatherManager {
    static let shared = WeatherManager()
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=a71c4410a8c4669adf5016a27f165b96&units=metric"
    private init() {}
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        URLSession(configuration: .default).dataTask(with: URLRequest(url: url)) { data, response, error in
            guard error == nil else { print(error!); return }
            guard let data else { return }
            guard let stringData = String(data: data, encoding: .utf8) else { return }
            print(stringData)
        }.resume()
    }
}
