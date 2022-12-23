//
//  Weather.swift
//  Clima
//
//  Created by Emir Alkal on 23.12.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    let main: Main
    let weather: [WeatherInfo]
    let name: String
}

struct WeatherInfo: Decodable {
    let id: Int
}

struct Main: Decodable {
    let temp: Float
}
