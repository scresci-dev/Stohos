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
    
//    @IBAction func doneButton(_ sender: Any) {
//        performSegue(withIdentifier: "Evaluate Again", sender: self)
//    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if (segue.identifier == "Evaluate Again") {
//        (segue.destination as! EditThoughtViewController).editedUserThought = currentThought
//        }
//    }
    
}
