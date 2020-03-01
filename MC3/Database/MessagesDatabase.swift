//
//  MessagesDatabase.swift
//  MC3
//
//  Created by Gianna Stylianou on 21/2/20.
//  Copyright © 2020 Gianna Stylianou. All rights reserved.
//

import Foundation

struct TutorialMessage {
    var textMessage: String = " "
    var imageName: String = " "
}

let message1 = TutorialMessage(textMessage: "Welcome to Stohos", imageName: " ")
let message2 = TutorialMessage(textMessage: "According to Minimalism as a state of mind, a thought is Essential when it brings you joy and has a vital meaning for you", imageName: "essential")
let message3 = TutorialMessage(textMessage: "A thought is Non-Essential when it can lead you to focus only on the negative and waste valuable mental energy", imageName: "not-essential")
let message4 = TutorialMessage(textMessage: "Ready to start your journey of mind decluttering?", imageName: " ")

var messageArray = [message1, message2, message3, message4]

//let longestWordRange = (longString as NSString).range(of: longestWord)
//
//let attributedString = NSMutableAttributedString(string: longString, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 20)])
//
//attributedString.setAttributes([NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 20), NSAttributedStringKey.foregroundColor : UIColor.red], range: longestWordRange)
