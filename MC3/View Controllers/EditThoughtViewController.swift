//
//  EditThoughtViewController.swift
//  MC3
//
//  Created by Gianna Stylianou on 27/2/20.
//  Copyright © 2020 Gianna Stylianou. All rights reserved.
//

import Foundation
import UIKit

class EditThoughtViewController: UIViewController {
    
    var editedUserThought: String!
    
    @IBOutlet weak var editField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editField.text = editedUserThought
    }
    
    @IBAction func donePressed(_ sender: Any) {
        performSegue(withIdentifier: "Evaluate Again", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     (segue.destination as! EvaluationThoughtViewController).finalThought = editField.text
    }
}
