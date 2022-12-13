//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

final class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value / 100)
        heightLabel.text = "\(height)m"
    }
    
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = Int(sender.value)
        weightLabel.text = "\(weight)kg"
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        calculatorBrain.height = heightSlider.value / 100
        calculatorBrain.weight = weightSlider.value

        guard let destVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? ResultViewController else {
            return
        }

        destVC.bmi = calculatorBrain.bmi
        destVC.color = calculatorBrain.bmiStatus?.0
        destVC.advice = calculatorBrain.bmiStatus?.1
        present(destVC, animated: true)
    }
}

