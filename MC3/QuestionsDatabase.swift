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
    var progress: UIImage!
}

var counter: Int = 0
var essentialCount: Int = 0
var notEssentialCount: Int = 0

let question1 = TutorialQuestion(question: "Share a thought of today", answer: " ", progress: UIImage(named: "image1"))
let question2 = TutorialQuestion(question: "What is your today goal?", answer: " ", progress: UIImage(named: "image2"))
let question3 = TutorialQuestion(question: "Tell me your thoughts", answer: " ", progress: UIImage(named: "image3"))
let question4 = TutorialQuestion(question: "How do you feel today?", answer: " ", progress: UIImage(named: "image4"))

var questionArray = [question1, question2, question3, question4]
