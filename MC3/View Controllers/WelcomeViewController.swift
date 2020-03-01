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
    
    var counter: Int = 0

    override func viewDidLoad() {
        //navigationItem.title = "Root View"
        let gestureRec = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
        initialView.addGestureRecognizer(gestureRec)
        super.viewDidLoad()
    }
    
    @objc func someAction(_ sender:UITapGestureRecognizer) {
        showMessages()
        counter += 1
    }
    
    
    func showMessages() {
        if (counter > 4 ) {
            performSegue(withIdentifier: "TutorialQuestion", sender: self)
        }
        else {
            textView.text = messageArray[counter].textMessage
            
        }
    }
}

