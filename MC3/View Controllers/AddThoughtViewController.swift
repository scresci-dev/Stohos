//
//  AddUserThought.swift
//  MC3
//
//  Created by Gianna Stylianou on 28/2/20.
//  Copyright © 2020 Gianna Stylianou. All rights reserved.
//

import Foundation
import UIKit

class AddThoughtViewController: UIViewController {
    
    @IBOutlet weak var newThought: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "greybackground.png")!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     (segue.destination as! EvaluationThoughtViewController).finalThought = newThought.text
    }
    
    
}
