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
}

let darkGrey = UIColor(red: 0.43, green: 0.43, blue: 0.43, alpha: 1)
let lightGrey = UIColor(red: 0.65, green: 0.65, blue: 0.65, alpha: 1)
let buttonColor = UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 1)
let backgroundColor = UIColor(red: 0.92, green: 0.92, blue: 0.92, alpha: 1)

let message1 = TutorialMessage(textMessage: "Welcome to Stohos", imageName: "Welcome")
let message2 = TutorialMessage(textMessage: "According to Minimalism as a state of mind, a thought is Essential when it brings you joy and has a vital meaning for you", imageName: "Essential Description")
let message3 = TutorialMessage(textMessage: "A thought is Non-Essential when it can lead you to focus only on the negative and waste valuable mental energy", imageName: "NonEssential Description")
let message4 = TutorialMessage(textMessage: "Ready to start your journey of mind decluttering?", imageName: "start your journey")

var messageArray = [message1, message2, message3, message4]

