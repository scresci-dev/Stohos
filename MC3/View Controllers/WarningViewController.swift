//
//  WarningViewController.swift
//  MC3
//
//  Created by Gianna Stylianou on 4/3/20.
//  Copyright © 2020 Gianna Stylianou. All rights reserved.
//

import Foundation
import UIKit

class WarningViewController: UIViewController {
    
    let backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        let gestureRec = UITapGestureRecognizer(target: self, action:  #selector (self.closeMessage(_:)))
        view.addGestureRecognizer(gestureRec)
    }
    
    func setBackground() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.image = UIImage(named: "dont")
    }
    
    @objc func closeMessage(_ sender:UITapGestureRecognizer) {
           dismiss(animated: true, completion: nil)
       }
}
