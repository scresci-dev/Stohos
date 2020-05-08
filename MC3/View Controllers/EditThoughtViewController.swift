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
    @IBOutlet weak var countLabel: UILabel!
    
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
    
    override func viewWillAppear(_ animated: Bool) {
         editField.becomeFirstResponder()
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText newText: String) -> Bool {
        if range.length + range.location > editField.text.count {
            return false 
        }
        countLabel.text = "\(editField.text.count + (newText.count - range.length))/250"
        countLabel.textColor = darkGrey
        countLabel.font = UIFont(name: "NewYorkMedium-Regular", size: 16)
        return editField.text.count + newText.count - range.length <= 249
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
    
    @IBAction func backButton(_ sender: Any) {
//         dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "Evaluate Again"){
        (segue.destination as! EvaluationThoughtViewController).finalThought = editField.text
        (segue.destination as! EvaluationThoughtViewController).isUpdate = isUpdate
            (segue.destination as! EvaluationThoughtViewController).oldText = editedUserThought
        }
      
    }

}
