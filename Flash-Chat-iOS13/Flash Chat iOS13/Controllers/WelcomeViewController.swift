//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animate()
    }

    func animate() {
        let string = "⚡️FlashChat"
        var i = 0.1
        titleLabel.text = ""
        for letter in string {
            Timer.scheduledTimer(withTimeInterval: i, repeats: false) { timer in
                self.titleLabel.text?.append(letter)
            }
            i += 0.1
        }
    }

}
