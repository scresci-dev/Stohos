//
//  WellDoneViewController.swift
//  MC3
//
//  Created by Gianna Stylianou on 4/3/20.
//  Copyright © 2020 Gianna Stylianou. All rights reserved.
//

import Foundation
import UIKit

class WellDoneViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gestureRec = UITapGestureRecognizer(target: self, action:  #selector (self.closePopUp(_:)))
        view.addGestureRecognizer(gestureRec)
    }
    
    @objc func closePopUp(_ sender:UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}
