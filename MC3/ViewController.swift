//
//  ViewController.swift
//  MC3
//
//  Created by Gianna Stylianou on 17/2/20.
//  Copyright © 2020 Gianna Stylianou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var initialView: UIView!

    
    override func viewDidLoad() {
         let gestureRec = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
        initialView.addGestureRecognizer(gestureRec)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func someAction(_ sender:UITapGestureRecognizer){

       // this is the function that lets us perform the segue
       performSegue(withIdentifier: "TutorialQuestion", sender: self)
    }
}

