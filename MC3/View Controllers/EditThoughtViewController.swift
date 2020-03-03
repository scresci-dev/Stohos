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
        overrideUserInterfaceStyle = .light
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "greybackground.png")!)
        editField.text = editedUserThought
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func donePressed(_ sender: Any) {
        performSegue(withIdentifier: "Evaluate Again", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     (segue.destination as! EvaluationThoughtViewController).finalThought = editField.text
        print("textField: \(editField.text)")
        print("edit: \(editedUserThought)")

        if(editField.text == editedUserThought){
        (segue.destination as! EvaluationThoughtViewController).isUpdate = "no"
        }else{
            (segue.destination as! EvaluationThoughtViewController).isUpdate = "yes"
            (segue.destination as! EvaluationThoughtViewController).oldText = editedUserThought
        }
    }
    @objc func keyboardWillShow(notification: NSNotification) {
           if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
               if self.view.frame.origin.y == 0 {
                   self.view.frame.origin.y -= keyboardSize.height
               }
           }
       }
       
       @objc func keyboardWillHide(notification: NSNotification) {
           if self.view.frame.origin.y != 0 {
               self.view.frame.origin.y = 0
           }
       }
       
       @objc func dismissKeyboard() {
           view.endEditing(true)
       }
}
