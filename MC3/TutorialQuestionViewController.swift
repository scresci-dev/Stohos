//
//  TutorialQuestion.swift
//  MC3
//
//  Created by Gianna Stylianou on 19/2/20.
//  Copyright © 2020 Gianna Stylianou. All rights reserved.
//

import Foundation
import UIKit

class TutorialQuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerText: UITextView!
    @IBOutlet weak var progressView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        answerText.layer.borderWidth = 1.0
        nextButton.setTitle("Next", for: .normal)
        displayView()
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

    @IBAction func buttonPressed(_ sender: Any) {
        view.endEditing(true)
        exitTutorial()
    }

    func exitTutorial() {
        if (counter > 3 ) {
            performSegue(withIdentifier: "Normal Flow", sender: self)
        }
        else {
        counter += 1
        performSegue(withIdentifier: "Evaluation Control", sender: self)
        }
    }
    
    func displayView() {
           questionLabel.text = questionArray[counter].question
           questionArray[counter].answer = answerText.text ?? ""
           progressView.image = questionArray[counter].progress
           print(questionArray[counter].answer)
           print(counter)
           if (counter == 3) {
               nextButton.setTitle("Done", for: .normal)
           }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! EvaluationViewController).userAnswer = answerText.text
        let destinationVC1 = segue.destination as! EvaluationViewController
        destinationVC1.count = counter
           // Get the new view controller using segue.destination.
           // Pass the selected object to the new view controller.
       }
}
