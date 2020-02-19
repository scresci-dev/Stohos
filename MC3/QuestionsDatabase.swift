//
//  QuestionsDatabase.swift
//  MC3
//
//  Created by Gianna Stylianou on 19/2/20.
//  Copyright © 2020 Gianna Stylianou. All rights reserved.
//

import Foundation
import UIKit

struct TutorialQuestion {
    var question: String
    var answer: String
}

let question1 = TutorialQuestion(question: "Share a thought of today", answer: " ")
let question2 = TutorialQuestion(question: "What is your today goal?", answer: " ")
let question3 = TutorialQuestion(question: "Tell me your thoughts", answer: " ")
let question4 = TutorialQuestion(question: "How do you feel today?", answer: " ")
let question5 = TutorialQuestion(question: "Share a thought of toda?", answer: " ")

var questionArray = [question1, question2, question3, question4, question5]
