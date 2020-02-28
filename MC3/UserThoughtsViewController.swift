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
    var currentThought: String = " "
    
    let image1 = UIImage(named: "\(arrayCheck[0])")
    let image2 = UIImage(named: "\(arrayCheck[1])")
    let image3 = UIImage(named: "\(arrayCheck[2])")
    let image4 = UIImage(named: "\(arrayCheck[3])")
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var thoughtView: UITextView!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.setImage(image1, for: .normal)
        button1.frame = CGRect(x: 30, y: 200, width: 100, height: 100)
        button2.setImage(image2, for: .normal)
        button2.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
        button3.setImage(image3, for: .normal)
        button3.frame = CGRect(x: 200, y: 300, width: 100, height: 100)
        button4.setImage(image1, for: .normal)
        button4.frame = CGRect(x: 30, y: 300, width: 100, height: 100)
        print(essentialThoughtCount)
        print(notEssentialThoughtCount)
    }
    
    @IBAction func press1(_ sender: Any) {
        thoughtView.text = allAnswer[0]
        currentThought = allAnswer[0]
    }
    
    @IBAction func press2(_ sender: Any) {
        thoughtView.text = allAnswer[1]
        currentThought = allAnswer[1]
        if (deleteButton.isSelected) {
            button2.isHidden = true
        }
    }
    
    @IBAction func press3(_ sender: Any) {
        thoughtView.text = allAnswer[2]
        currentThought = allAnswer[2]
        if (deleteButton.isSelected) {
            button3.isHidden = true
        }
    }
    
    @IBAction func press4(_ sender: Any) {
        thoughtView.text = allAnswer[3]
        currentThought = allAnswer[3]
        if (deleteButton.isSelected) {
            button4.isHidden = true
        }
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
        else if (button4.isTouchInside == true) {
            button4.isHidden = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Edit Thought") {
        (segue.destination as! EditThoughtViewController).editedUserThought = currentThought
        }
    }
}
