//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var firstOptionButton: UIButton!
    @IBOutlet var secondOptionButton: UIButton!
    @IBOutlet var thirdOptionButton: UIButton!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var questionText: UILabel!
    @IBOutlet var scoreLabel: UILabel!

    var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        if quizBrain.checkAnswer(sender.currentTitle!) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { [self] _ in
            updateUI()
        }
    }

    func updateUI() {
        resetButtons(answers: quizBrain.getAnswers())
        questionText.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = quizBrain.getScoreLabel()
    }

    func resetButtons(answers: [String]) {
        // set the new possiable answers
        print(answers)
        firstOptionButton.setTitle(answers[0], for: .normal)
        secondOptionButton.setTitle(answers[1], for: .normal)
        thirdOptionButton.setTitle(answers[2], for: .normal)

        // set background color to clear
        firstOptionButton.backgroundColor = UIColor.clear
        secondOptionButton.backgroundColor = UIColor.clear
        thirdOptionButton.backgroundColor = UIColor.clear

        // enable the buttons
        firstOptionButton.isEnabled = true
        secondOptionButton.isEnabled = true
        thirdOptionButton.isEnabled = true
    }
}
