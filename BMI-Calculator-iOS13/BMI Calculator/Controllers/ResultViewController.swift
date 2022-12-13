//
//  SecondViewController.swift
//  BMI Calculator
//
//  Created by Emir Alkal on 13.12.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    var bmi: String?
    var color: UIColor?
    var advice: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmi
        adviceLabel.text = advice
        view.backgroundColor = color
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
