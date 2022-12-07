//
//  ViewController.swift
//  Dicee
//
//  Created by Emir Alkal on 7.12.2022.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var leftDiceImageView: UIImageView!
    @IBOutlet weak var rightDiceImageView: UIImageView!
    let imageArray = [#imageLiteral(resourceName: "dice1"), #imageLiteral(resourceName: "dice2.png"), #imageLiteral(resourceName: "dice3.png"), #imageLiteral(resourceName: "dice4"), #imageLiteral(resourceName: "dice5"), #imageLiteral(resourceName: "dice6")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        leftDiceImageView.image = imageArray.randomElement()
        rightDiceImageView.image = imageArray.randomElement()
    }
}

