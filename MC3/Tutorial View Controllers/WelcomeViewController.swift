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
    
//    @IBOutlet weak var userTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    var counter: Int = 0

//    let startPositions = [[0, 0, 0], [57, 73, 98], [13, 69, 82], [31, 0, 0]]
//    let lengths = [[0, 0, 0], [9, 14, 13], [13, 8, 28], [17]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        let gestureRec = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
        initialView.addGestureRecognizer(gestureRec)
        showMessages()
    }

    
    @objc func someAction(_ sender:UITapGestureRecognizer) {
        counter += 1
        showMessages()
    }
    
    
    func showMessages() {
        if (counter > 3 ) {
            performSegue(withIdentifier: "TutorialQuestion", sender: self)
        }
        else {
            imageView.image = UIImage(named: "\(messageArray[counter].imageName)")
        }
    }
}

