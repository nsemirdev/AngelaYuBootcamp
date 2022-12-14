//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Emir Alkal on 14.12.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var info: (personCount: String, tip: Float, billPerPerson: Float)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let info else { return }
        
        totalLabel.text = "\(info.billPerPerson)"
        settingsLabel.text = """
        Split between \(info.personCount) people,
        with \(String(format: "%.0f", info.tip))% tip.
        """
        
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
