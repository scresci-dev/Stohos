//
//  EditThoughtViewController.swift
//  MC3
//
//  Created by Gianna Stylianou on 27/2/20.
//  Copyright © 2020 Gianna Stylianou. All rights reserved.
//

import Foundation
import UIKit

class EditThoughtViewController: UIViewController, UITextViewDelegate {
    
    var editedUserThought = String()
    
    @IBOutlet weak var editField: UITextView!
    @IBOutlet weak var doneEditButton: UIButton?
    
    var isUpdate = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        editField.delegate = self
        editField.text = editedUserThought
        editField.font = UIFont(name: "NewYorkMedium-Regular", size: 18)
        
        editField.textAlignment = .left
        editField.textColor = lightGrey
        doneEditButton?.titleLabel?.font = UIFont(name: "NewYorkMedium-Regular", size: 25)
        doneEditButton?.setTitleColor(buttonColor, for: .normal)
        doneEditButton?.setTitle("Done", for: .normal)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText newText: String) -> Bool {
           return editField.text.count + (newText.count - range.length) <= 250
       }
    
    @IBAction func donePressed(_ sender: Any) {
        if editField.text.isEmpty {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.warning)
        }
        else {
            performSegue(withIdentifier: "Evaluate Again", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     (segue.destination as! EvaluationThoughtViewController).finalThought = editField.text
        (segue.destination as! EvaluationThoughtViewController).isUpdate = isUpdate
            (segue.destination as! EvaluationThoughtViewController).oldText = editedUserThought

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        editField.becomeFirstResponder()
    }
//        @objc func keyboardWillShow(notification: NSNotification) {
//            if ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
//               if self.view.frame.origin.y == 0 {
//                   self.view.frame.origin.y -= 240
//
//               }
//           }
//       }
//
//       @objc func keyboardWillHide(notification: NSNotification) {
//           if self.view.frame.origin.y != 0 {
//               self.view.frame.origin.y = 0
//           }
//       }
//
//       @objc func dismissKeyboard() {
//           view.endEditing(true)
//       }
}
