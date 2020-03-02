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
            userTextView.frame = CGRect(x: 80.0, y: 400.0, width: 250.0, height: 100.0)
            userTextView.textAlignment = NSTextAlignment.center
            userTextView.textColor = lightGrey
            userTextView.font = UIFont(name: "NewYorkMedium-Regular", size: CGFloat(messageArray[counter].sizeFont))
            let longestWordRange = (messageArray[counter].textMessage as NSString).range(of: messageArray[counter].boldWord)
            let attributedString1 = NSMutableAttributedString(string: messageArray[counter].textMessage, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)])

            attributedString1.setAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .semibold), NSAttributedString.Key.foregroundColor : darkGrey], range: longestWordRange)
        showMessages()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        let attributedString = NSMutableAttributedString(string: userTextView.text)
//    attributedString.addAttribute(NSAttributedString.Key.kern, value: CGFloat(0.6), range: NSRange(location: 0, length: attributedString.length))
//        userTextView.attributedText = attributedString
//        let style = NSMutableParagraphStyle()
//        style.lineSpacing = 24
//        let attributes = [NSAttributedString.Key.paragraphStyle: style]
//        userTextView.attributedText = NSAttributedString(string: userTextView.text, attributes: attributes)
//        self.view.addSubview(userTextView)
//        userTextView.allowsEditingTextAttributes = true
//        userTextView.frame = CGRect(x: 80.0, y: 400.0, width: 250.0, height: 200.0)
//        userTextView.textAlignment = NSTextAlignment.center
//        userTextView.textColor = lightGrey
//        userTextView.font = UIFont(name: "NewYorkMedium-Regular", size: CGFloat(messageArray[counter].sizeFont))
//        var longestWordRange = (messageArray[counter].textMessage as NSString).range(of: messageArray[counter].boldWord)
//        var attributedString1 = NSMutableAttributedString(string: messageArray[counter].textMessage, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)])
//
//        attributedString1.setAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .semibold), NSAttributedString.Key.foregroundColor : darkGrey], range: longestWordRange)
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

