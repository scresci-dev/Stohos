//
//  ThoughtsViewController.swift
//  MC3
//
//  Created by Gianna Stylianou on 26/2/20.
//  Copyright © 2020 Gianna Stylianou. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class UserThoughtsViewController: UIViewController {
    
    var essentialThoughtCount: Int = 0
    var notEssentialThoughtCount: Int = 0
    var currentThought: String = " "
    var newThought: String = " "
    
    let image1 = UIImage(named: "\(arrayCheck[0])")
    let image2 = UIImage(named: "\(arrayCheck[1])")
    let image3 = UIImage(named: "\(arrayCheck[2])")
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var thoughtView: UITextView!
    @IBOutlet weak var deleteButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        allAnswer.append(currentThought)
        displayMainView()
    }
    
    func displayMainView() {
        button1.setImage(image1, for: .normal)
        button1.frame = CGRect(x: 30, y: 200, width: 100, height: 100)
        button2.setImage(image2, for: .normal)
        button2.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
        button3.setImage(image3, for: .normal)
        button3.frame = CGRect(x: 200, y: 300, width: 100, height: 100)
    }
    
    @IBAction func press1(_ sender: Any) {
        thoughtView.text = allAnswer[0]
        currentThought = allAnswer[0]
    }
    
    @IBAction func press2(_ sender: Any) {
        thoughtView.text = allAnswer[1]
        currentThought = allAnswer[1]
    }
    
    @IBAction func press3(_ sender: Any) {
        thoughtView.text = allAnswer[2]
        currentThought = allAnswer[2]
    }

    
    @IBAction func editButton(_ sender: Any) {
        performSegue(withIdentifier: "Edit Thought", sender: self)
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        if (button1.isTouchInside == true) {
            button1.isHidden = true
        }
        else if (button2.isTouchInside == true) {
            button2.isHidden = true
        }
        else if (button3.isTouchInside == true) {
            button3.isHidden = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Edit Thought") {
            (segue.destination as! EditThoughtViewController).editedUserThought = currentThought
        }
//        if (segue.identifier == "Add Thought") {
//            (segue.destination as! AddThoughtViewController).
//        }
    }
}
