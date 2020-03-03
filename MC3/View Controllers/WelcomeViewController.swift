//
//  ViewController.swift
//  MC3
//
//  Created by Gianna Stylianou on 17/2/20.
//  Copyright © 2020 Gianna Stylianou. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var initialView: UIView!
    
    @IBOutlet weak var userTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    var counter: Int = 0

//    let startPositions = [[0, 0, 0], [57, 73, 98], [13, 69, 82], [31, 0, 0]]
//    let lengths = [[0, 0, 0], [9, 14, 13], [13, 8, 28], [17]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        let gestureRec = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
        initialView.addGestureRecognizer(gestureRec)
        let attributedString = NSMutableAttributedString(string: userTextView.text)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: CGFloat(0.6), range: NSRange(location: 0, length: attributedString.length))
            userTextView.attributedText = attributedString
            let style = NSMutableParagraphStyle()
            style.lineSpacing = 24
            let attributes = [NSAttributedString.Key.paragraphStyle: style]
            userTextView.attributedText = NSAttributedString(string: userTextView.text, attributes: attributes)
            self.view.addSubview(userTextView)
            userTextView.allowsEditingTextAttributes = true
            userTextView.frame = CGRect(x: 70.0, y: 400.0, width: 280.0, height: 150.0)
            userTextView.textAlignment = NSTextAlignment.center
            userTextView.textColor = lightGrey
            userTextView.font = UIFont(name: "NewYorkMedium-Regular", size: CGFloat(messageArray[counter].sizeFont))
        showMessages()
    }
    
//    func attributedString(from string: String, semiboldRange: NSRange?) -> NSAttributedString {
//        let attrs = [
//            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)
//        ]
//        let semiboldAttribute = [
//            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .semibold)
//        ]
//        let attrStr = NSMutableAttributedString(string: string, attributes: attrs)
//        if let range = semiboldRange {
//            attrStr.setAttributes(semiboldAttribute, range: range)
//        }
//        return attrStr
//    }

    
    @objc func someAction(_ sender:UITapGestureRecognizer) {
        counter += 1
        showMessages()
    }
    
    
    func showMessages() {
        if (counter > 3 ) {
            performSegue(withIdentifier: "TutorialQuestion", sender: self)
        }
        else {
            userTextView.text = messageArray[counter].textMessage
            imageView.image = UIImage(named: "\(messageArray[counter].imageName)")
        }
    }
}

