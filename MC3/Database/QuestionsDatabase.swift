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
    var progress: UIImage!
}

var counter: Int = 0
var count: Int = 0
var essentialCount: Int = 0
var notEssentialCount: Int = 0
var arrayCheck: [String] = []
var allAnswer: [String] = []

let question1 = TutorialQuestion(question: "Share a thought of today", progress: UIImage(named: "image1"))
let question2 = TutorialQuestion(question: "What is your today goal?", progress: UIImage(named: "image2"))
let question3 = TutorialQuestion(question: "Tell me your thoughts", progress: UIImage(named: "image3"))

var questionArray = [question1, question2, question3]
