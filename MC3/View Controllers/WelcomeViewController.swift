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
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    var counter: Int = 0

    override func viewDidLoad() {
        
        let gestureRec = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
        initialView.addGestureRecognizer(gestureRec)
        super.viewDidLoad()
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
            textView.text = messageArray[counter].textMessage
            textView.textColor = UIColor(red: 0.65, green: 0.65, blue: 0.65, alpha: 1)
            textView.font = UIFont(name: "New York Medium", size: 18)
            imageView.image = UIImage(named: "\(messageArray[counter].imageName)")
        }
    }
}

