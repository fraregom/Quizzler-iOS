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
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    
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
            self.aButton.backgroundColor = UIColor.clear
            self.bButton.backgroundColor = UIColor.clear
            self.cButton.backgroundColor = UIColor.clear
        }
    }
    
    func updateUI(){
        questionText.text = quiz.getQuestionText()
        aButton.setTitle(quiz.getAlternativesText()[0], for: .normal)
        bButton.setTitle(quiz.getAlternativesText()[1], for: .normal)
        cButton.setTitle(quiz.getAlternativesText()[2], for: .normal)
        
        progressBar.progress = quiz.getProgress()
        scoreLabel.text = "Score: \(quiz.getScore())"
    }
    
    
    
}

