//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Mostafa Abdelazim on 02/02/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
struct QuizBrain {
    var questionsNumber = 0
    var score = 0
    let questions: Array<Question> = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia"),
    ]

    mutating func checkAnswer(_ answer: String) -> Bool {
        let isCorrectAnswer = answer == questions[questionsNumber].correctAnswer
        if isCorrectAnswer {
            score += 1
        }
        return isCorrectAnswer
    }

    func getProgress() -> Float {
        return Float(questionsNumber + 1) / Float(questions.count)
    }

    func getQuestionText() -> String {
        return questions[questionsNumber].text
    }

    mutating func nextQuestion() {
        if questionsNumber + 1 < questions.count {
            questionsNumber += 1
        } else {
            questionsNumber = 0
            score = 0
        }
    }

    func getScoreLabel() -> String {
        return "Score: \(score)"
    }

    func getAnswers() -> [String] {
        return questions[questionsNumber].answers
    }
}
