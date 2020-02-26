//
//  TutorialEvaluationViewController.swift
//  MC3
//
//  Created by Gianna Stylianou on 20/2/20.
//  Copyright © 2020 Gianna Stylianou. All rights reserved.
//

import Foundation
import UIKit

class EvaluationViewController: UIViewController {
   
    @IBOutlet weak var textAnswer: UITextView!
    @IBOutlet weak var essentialView: UIImageView!
    @IBOutlet weak var notEssentialView: UIImageView!
    @IBOutlet weak var notEssentialButton: UIButton!
    @IBOutlet weak var essentialButton: UIButton!
    
    var userAnswer: String!
    var count: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textAnswer.text = userAnswer
    }
    
    @IBAction func nextMove(_ sender: Any) {
        if (count <= 3) {
                      performSegue(withIdentifier: "Next Question", sender: self)
                  } else if (count > 3) {
                      performSegue(withIdentifier: "Main View", sender: self)
                  }
    }
    
}
