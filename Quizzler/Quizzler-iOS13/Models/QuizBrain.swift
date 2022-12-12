//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Emir Alkal on 12.12.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    private var quiz = [
      Question(q: "A slug's blood is green.", a: "True"),
            Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
            Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
            Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
            Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
            Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
            Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
            Question(q: "Google was originally called 'Backrub'.", a: "True"),
            Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
            Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
            Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
            Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    private var questionNumber = 0
    private var score = 0
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].a {
            score += 1
            return true
        }
        return false
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            score = 0
            questionNumber = 0
        }
    }
    
    func getQuestion() -> Question {
        return quiz[questionNumber]
    }
    
    func getProgress() -> Float {
       return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    func getScore() -> Int {
        return score
    }
}

