//
//  WellDoneViewController.swift
//  MC3
//
//  Created by Gianna Stylianou on 29/2/20.
//  Copyright © 2020 Gianna Stylianou. All rights reserved.
//

import Foundation
import UIKit

class WellDoneViewController: UIViewController {
    
    @IBOutlet var wellDoneView: UIView!
    @IBOutlet weak var wellDoneLabel: UILabel!
    @IBOutlet weak var wellDoneText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        wellDoneText.textColor = lightGrey
        wellDoneText.font = UIFont(name: "NewYorkMedium-Regular", size: 18)
        wellDoneText.frame = CGRect(x: 70.0, y: 400.0, width: 280.0, height: 150.0)
        wellDoneLabel.textColor = darkGrey
        wellDoneLabel.font = UIFont(name: "NewYorkMedium-Regular", size: 25)
        wellDoneLabel.frame = CGRect(x: 100.0, y: 300.0, width: 200.0, height: 50.0)
        let gestureRec = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
        
        wellDoneView.addGestureRecognizer(gestureRec)
    }
    
    @objc func someAction(_ sender:UITapGestureRecognizer) {
        performSegue(withIdentifier: "Main View", sender: self)
    }
    
}

