//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdatePrice(with model: PriceResponse)
}

struct CoinManager {
    var delegate: CoinManagerDelegate?
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "FAD4F650-241C-4AF3-A7A0-87074E62430E"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    
    func getPrice(with currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        print(urlString)
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        URLSession(configuration: .default).dataTask(with: URLRequest(url: url)) { data, _, error in
            guard error == nil else { return }
            guard let data else { return }
            guard let price = self.parseJSON(with: data) else { return }
            self.delegate?.didUpdatePrice(with: price)
        }.resume()
    }
    
    func parseJSON(with data: Data) -> PriceResponse? {
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(PriceResponse.self, from: data) else { return nil }
        return result
    }
}
