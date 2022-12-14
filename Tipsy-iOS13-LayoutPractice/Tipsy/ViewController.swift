//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var splitNumber: UILabel!
    
    var tipPercentage: Float = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroButton.isSelected = false
        tenButton.isSelected = false
        twentyButton.isSelected = false
        
        sender.isSelected = true
        tipPercentage = Float(sender.tag)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumber.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let bill = billTextField.text else { return }
        guard let personCount = splitNumber.text else { return }
        guard let personCountAsFloat = Float(personCount) else { return }
        guard var billFloat = Float(bill) else { return }
        
        
        billFloat += billFloat * tipPercentage / 100
        let result = billFloat / personCountAsFloat
        
        guard let destVC = storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as? ResultsViewController else { return }
        destVC.info = (personCount: personCount, tip: tipPercentage, billPerPerson: result)
        
        present(destVC, animated: true)
    }
}

