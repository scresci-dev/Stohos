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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "greybackground.png")!)
        
        let gestureRec = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
        
        wellDoneView.addGestureRecognizer(gestureRec)
    }
    
    @objc func someAction(_ sender:UITapGestureRecognizer) {
        performSegue(withIdentifier: "Main View", sender: self)
    }
}
