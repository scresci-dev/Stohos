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
    
    let backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        let gestureRec = UITapGestureRecognizer(target: self, action:  #selector (self.closePopUp(_:)))
        view.addGestureRecognizer(gestureRec)
    }
    
    func setBackground() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.image = UIImage(named: "WellDone")
    }
    
    @objc func closePopUp(_ sender:UITapGestureRecognizer) {
        performSegue(withIdentifier: "GoBack", sender: self)
    }
}
