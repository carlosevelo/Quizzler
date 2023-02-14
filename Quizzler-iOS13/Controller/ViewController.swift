//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var answerA: UIButton!
    @IBOutlet weak var answerB: UIButton!
    @IBOutlet weak var answerC: UIButton!
    
    var quizBrain = QuizBrain()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        let result = quizBrain.checkAnswer(sender.currentTitle!)
        
        if result == true {
            sender.backgroundColor = UIColor.green
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: { [self] _ in
            updateUI()
        })
    }
    
    func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        let answers = quizBrain.getAnswers()
        
        answerA.backgroundColor = UIColor.clear
        answerA.setTitle(answers[0], for: .normal)
        answerB.backgroundColor = UIColor.clear
        answerB.setTitle(answers[1], for: .normal)
        answerC.backgroundColor = UIColor.clear
        answerC.setTitle(answers[2], for: .normal)
    }
    
}

