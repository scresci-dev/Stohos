//
//  ThoughtsViewController.swift
//  MC3
//
//  Created by Gianna Stylianou on 26/2/20.
//  Copyright © 2020 Gianna Stylianou. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class UserThoughtsViewController: UIViewController {
    
    var userThought = [String]()
    var essentialThoughtCount: Int = 0
    var notEssentialThoughtCount: Int = 0
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var thoughtView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(essentialThoughtCount)
        print(notEssentialThoughtCount)
    }
    
    @IBAction func press1(_ sender: Any) {
        thoughtView.text = allAnswer[0]
    }
    
    @IBAction func press2(_ sender: Any) {
        thoughtView.text = allAnswer[1]
    }
    
    @IBAction func press3(_ sender: Any) {
        thoughtView.text = allAnswer[2]
    }
    
    @IBAction func press4(_ sender: Any) {
        thoughtView.text = allAnswer[3]
    }
    
    
}
