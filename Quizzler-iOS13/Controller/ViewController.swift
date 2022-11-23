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
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quiz = quizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        sender.backgroundColor = quiz.getAnswerColor(userAnswer)
        
        quiz.moveQuestion()
        updateUI()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.trueButton.backgroundColor = UIColor.clear
            self.falseButton.backgroundColor = UIColor.clear
        }
    }
    
    func updateUI(){
        questionText.text = quiz.getQuestionText()
        progressBar.progress = quiz.getProgress()
        scoreLabel.text = "Score: \(quiz.getScore())"
    }
    
    
    
}

