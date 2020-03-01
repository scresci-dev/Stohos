//
//  TutorialQuestion.swift
//  MC3
//
//  Created by Gianna Stylianou on 19/2/20.
//  Copyright © 2020 Gianna Stylianou. All rights reserved.
//

import Foundation
import UIKit

class TutorialQuestionViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerText: UITextView!
    @IBOutlet weak var progressView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerText.delegate = self
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "greybackground.png")!)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        editAnswerText()
        editButton()
        displayView()
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText newText: String) -> Bool {
        return answerText.text.count + (newText.count - range.length) <= 250
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
        counter += 1
        performSegue(withIdentifier: "Evaluation Control", sender: self)
    }
    
    func editAnswerText() {
        //answerText.layer.borderWidth = 1.0
        answerText.textAlignment = .center
        answerText.textColor = lightGrey
        answerText.font = UIFont(name: "New York Medium", size: 18)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 24
        let attributes = [NSAttributedString.Key.paragraphStyle: style]
        answerText.attributedText = NSAttributedString(string: answerText.text, attributes: attributes)
    }
    
    func editButton() {
        nextButton.setTitleColor(darkGrey, for: .normal)
        nextButton.setTitle("Next", for: .normal)
    }
    
    func displayView() {
        if (counter <= 2) {
            questionLabel.textColor = darkGrey
            questionLabel.font = UIFont(name: "New York Medium", size: 25)
            questionLabel.textAlignment = .center
            let style1 = NSMutableParagraphStyle()
            style1.lineSpacing = 28
            let attributes1 = [NSAttributedString.Key.paragraphStyle: style1]
            questionLabel.attributedText = NSAttributedString(string: questionLabel.text!, attributes: attributes1)
            questionLabel.text =  questionArray[counter].question
            progressView.image = questionArray[counter].progress
            print(counter)
            if (counter == 2) {
               nextButton.setTitle("Done", for: .normal)
            }
            }
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! TutorialEvaluationViewController).userAnswer = answerText.text
       }
}

