//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var passedTime = 0
    var totalTime = 0
    var timer: Timer?
    let eggTimes = [
        "Soft": 5,
        "Medium": 7,
        "Hard": 12
    ]

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBAction func hardnessSelected(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        guard let hardness = button.currentTitle else { return }
        if let timer { timer.invalidate() }
        
        startTimer(with: eggTimes[hardness, default: 5])
    }
    
    func startTimer(with number: Int) {
        passedTime = 0
        progressView.progress = 0.0
        totalTime = number
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if passedTime < totalTime {
            passedTime += 1
            progressView.progress = Float(passedTime) / Float(totalTime)
        } else {
            timer?.invalidate()
            titleLabel.text = "DONE"
        }
    }
    
}
