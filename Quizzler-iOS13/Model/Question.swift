//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Francisco Reyes on 21-11-22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var alternatives: [String]
    var answer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.alternatives = a
        self.answer = correctAnswer
    }
}
