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
}

var counter: Int = 0

let message1 = TutorialMessage(textMessage: "Welcome")
let message2 = TutorialMessage(textMessage: "You are beautiful and mindfull")
let message3 = TutorialMessage(textMessage: "Esential is...")
let message4 = TutorialMessage(textMessage: "Not essential is...")
let message5 = TutorialMessage(textMessage: "The session starts now")

var messageArray = [message1, message2, message3, message4, message5]

