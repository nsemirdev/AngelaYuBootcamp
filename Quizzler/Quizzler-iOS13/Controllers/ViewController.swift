//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    var quizBrain = QuizBrain()
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard let userAnswer = sender.currentTitle else { return }
        
        if quizBrain.checkAnswer(userAnswer: userAnswer) {
            sender.backgroundColor = .systemGreen
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                sender.backgroundColor = .clear
            }
        } else {
            sender.backgroundColor = .systemRed
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                sender.backgroundColor = .clear
            }
        }
        
        quizBrain.nextQuestion()
        updateUI()
    }
    
    fileprivate func updateUI() {
        let answers = quizBrain.getAnswers()
        for button in buttons {
            button.setTitle(answers[button.tag], for: .normal)
        }
        
        questionLabel.text = quizBrain.getQuestion().q
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score : \(quizBrain.getScore())"
    }
}

