//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Emir Alkal on 13.12.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var height: Float?
    var weight: Float?
    
    var bmi: String? {
        if let height, let weight {
            return String(format: "%.1f", weight / (height * height))
        }
        return "0.0"
    }
    
    var bmiStatus: (UIColor, String)? {
        if let bmi {
            if let floatBmi = Float(bmi) {
                switch floatBmi {
                case 0..<18.5:
                    return (.systemBlue, "Eat more pies!")
                case 18.5..<24.9:
                    return (.systemGreen, "Fit as a fiddle!")
                default:
                    return (.systemRed, "Eat less pies!")
                }
            }
        }
        
        return (.clear, "d")
    }
    
}
