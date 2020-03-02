//
//  MessagesDatabase.swift
//  MC3
//
//  Created by Gianna Stylianou on 21/2/20.
//  Copyright © 2020 Gianna Stylianou. All rights reserved.
//

import Foundation
import UIKit

struct TutorialMessage {
    var textMessage: String = " "
    var imageName: String = " "
    var sizeFont: Int = 0
    var boldWord: String = " "
}

let darkGrey = UIColor(red: 0.43, green: 0.43, blue: 0.43, alpha: 1)
let lightGrey = UIColor(red: 0.65, green: 0.65, blue: 0.65, alpha: 1)

let message1 = TutorialMessage(textMessage: "Welcome to Stohos", imageName: " ", sizeFont: 18, boldWord: "Stohos")
let message2 = TutorialMessage(textMessage: "According to Minimalism as a state of mind, a thought is Essential when it brings you joy and has a vital meaning for you", imageName: "essential", sizeFont: 18, boldWord: "Essential")
let message3 = TutorialMessage(textMessage: "A thought is Non-Essential when it can lead you to focus only on the negative and waste valuable mental energy", imageName: "not-essential", sizeFont: 18, boldWord: "Non-Essential")
let message4 = TutorialMessage(textMessage: "Ready to start your journey of mind decluttering?", imageName: " ", sizeFont: 25, boldWord: "mind decluttering")

var messageArray = [message1, message2, message3, message4]

//let longestWordRange = (longString as NSString).range(of: longestWord)
//
//let attributedString = NSMutableAttributedString(string: longString, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20)])
//
//attributedString.setAttributes([NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 20), NSAttributedStringKey.foregroundColor : UIColor.red], range: longestWordRange)
