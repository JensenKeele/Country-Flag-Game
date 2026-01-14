//
//  File.swift
//  Country Flag Game
//
//  Created by Jensen Keele on 1/9/26.
//

import Foundation
import SwiftUI

@Observable
class GameManager {
    var questions = [Question]()
    private(set) var index = 0
    private(set) var playingGame = false
    private(set) var answerSelected = false
    private(set) var country = ""
    private(set) var answerChoices = [Answer]()
    private(set) var progress: CGFloat = 0.0
    private(set) var score = 0
    init() {
        reset()
    }
    func reset() {
        loadQuestions()
        questions = questions.shuffled()
        index = 0
        score = 0
        progress = 0.0
        playingGame = true
        goToNextQuestion()
    }
    func loadQuestions() {
        let countries = Data().countries
        if countries.count < 4 {
            print("There are only \(countries.count) countries listed in Data (must be at least 4)")
        }
        else {
            questions.removeAll()
            for country in countries {
                if UIImage(named: country) != nil {
                    
                }
                else {
                    print("\(country) image can not be found")
                }
            }
        }
    }
    func goToNextQuestion() {
        if index < questions.count {
            answerSelected = false
            progress = CGFloat(index) / CGFloat(questions.count) * 350.0
            let nextQuestion = questions[index]
            country = nextQuestion.correctAnswer.text
            answerChoices = ([nextQuestion.correctAnswer] + nextQuestion.incorrectAnswers).shuffled()
            index += 1
        }
        else {
            playingGame = false 
        }
    }
    func selectAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
}
