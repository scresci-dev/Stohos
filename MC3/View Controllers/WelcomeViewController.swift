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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeTextView()
        let gestureRec = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
        initialView.addGestureRecognizer(gestureRec)
    }
    
    func changeTextView() {
        userTextView.allowsEditingTextAttributes = true
        userTextView.frame = CGRect(x: 80.0, y: 450.0, width: 250.0, height: 100.0)
        userTextView.textAlignment = NSTextAlignment.center
           // Update UITextView font size and colour
        userTextView.font = UIFont.systemFont(ofSize: 18)
        userTextView.textColor = lightGrey
        userTextView.font = UIFont(name: "New York Medium", size: 18)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 24
        let attributes = [NSAttributedString.Key.paragraphStyle: style]
        userTextView.attributedText = NSAttributedString(string: userTextView.text, attributes: attributes)
        self.view.addSubview(userTextView)
        }
    
    
    @objc func someAction(_ sender:UITapGestureRecognizer) {
        showMessages()
        counter += 1
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

