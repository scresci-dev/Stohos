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
    @IBOutlet weak var essentialButton: UIButton!
    @IBOutlet weak var notEssentialButton: UIButton!
    
    var userAnswer: String!
    var count: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textAnswer.text = userAnswer
        allAnswer.append(userAnswer)
        print(allAnswer)
    }
    
    @IBAction func essentialButton(_ sender: Any) {
        arrayCheck.append("blob0")
        essentialCount += 1
    }
    
    @IBAction func notEssentialButton(_ sender: Any) {
        arrayCheck.append("blob1")
        notEssentialCount += 1
    }
    
    
    @IBAction func nextMove(_ sender: Any) {
        if (count <= 3) {
            performSegue(withIdentifier: "Next Question", sender: self) }
        else if (count == 4) {
            performSegue(withIdentifier: "Main View", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Main View") {
            (segue.destination as! UserThoughtsViewController).essentialThoughtCount = essentialCount
            (segue.destination as! UserThoughtsViewController).notEssentialThoughtCount = notEssentialCount
            (segue.destination as! UserThoughtsViewController).userThought = allAnswer
        }
    }
}
