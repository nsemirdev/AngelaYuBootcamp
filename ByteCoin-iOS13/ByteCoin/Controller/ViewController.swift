//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, CoinManagerDelegate {
    
    var coinManager = CoinManager()

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var currencyPickerView: UIPickerView!
    @IBOutlet weak var currencyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coinManager.delegate = self
        currencyPickerView.delegate = self
        currencyPickerView.dataSource = self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currency = coinManager.currencyArray[row]
        currencyLabel.text = currency
        coinManager.getPrice(with: currency)
    }
    
    func didUpdatePrice(with model: PriceResponse) {
        DispatchQueue.main.async {
            self.priceLabel.text = String(format: "%.1f", model.rate)
        }
    }
}

