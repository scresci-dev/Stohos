//
//  WellDoneViewController.swift
//  MC3
//
//  Created by Gianna Stylianou on 29/2/20.
//  Copyright © 2020 Gianna Stylianou. All rights reserved.
//

import Foundation
import UIKit

class PerfectViewController: UIViewController {
    
    @IBOutlet var perfectView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        let gestureRec = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
        
        perfectView.addGestureRecognizer(gestureRec)
    }
    
    @objc func someAction(_ sender:UITapGestureRecognizer) {
        UserDefaults.standard.set(true, forKey: "LaunchedBefore")
        performSegue(withIdentifier: "Main View", sender: self)
    }
    
}

