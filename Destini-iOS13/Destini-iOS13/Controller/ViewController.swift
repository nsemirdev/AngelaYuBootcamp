//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
  
    @IBAction func buttonPressed(_ sender: UIButton) {
        storyBrain.toNextStory(sender.tag)
        updateUI()
    }
    
    func updateUI() {
        let story = storyBrain.getStory()
        let choices = storyBrain.getChoices()
        storyLabel.text = story
        choice1Button.setTitle(choices.0, for: .normal)
        choice2Button.setTitle(choices.1, for: .normal)
    }
}

