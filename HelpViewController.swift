//
//  HelpViewController.swift
//  MC3
//
//  Created by Gianna Stylianou on 3/3/20.
//  Copyright © 2020 Gianna Stylianou. All rights reserved.
//

import Foundation
import UIKit

class HelpViewController: UIViewController {
    
    @IBOutlet weak var essentialView: UITextView!
    @IBOutlet weak var notEssentialView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        essentialView.text = messageArray[1].textMessage
        essentialView.font = UIFont(name: "NewYorkMedium-Regular", size: 18)
        essentialView.textAlignment = .center
        essentialView.textColor = lightGrey
        notEssentialView.text = messageArray[2].textMessage
        notEssentialView.font = UIFont(name: "NewYorkMedium-Regular", size: 18)
        notEssentialView.textAlignment = .center
        notEssentialView.textColor = lightGrey
    }
}
