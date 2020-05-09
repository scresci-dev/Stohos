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
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        answerText.delegate = self
        editAnswerText()
        editButton()
        displayView()
    }
    
   func textViewDidBeginEditing(_ textView: UITextView) {
       if textView.textColor == UIColor.lightGray {
           textView.text = nil
           textView.textColor = UIColor.black
       }
   }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText newText: String) -> Bool {
        
        var nsString:NSString = ""
               
        if textView.text != nil  && newText != "" {
            nsString = textView.text! as NSString
            nsString = nsString.replacingCharacters(in: range, with: newText) as NSString
        }   else if (newText == "") && textView.text != ""  {
            nsString = textView.text! as NSString
            nsString = nsString.replacingCharacters(in: range, with: newText) as NSString
                   
        } else if (newText == "") && textView.text == "" {
            textView.text = ""
        }

       guard textView.text != nil else { return true }
       let currentText = nsString as NSString
       countLabel.text = "\(textView.text.count + (newText.count - range.length))/250"
       countLabel.textColor = darkGrey
       countLabel.font = UIFont(name: "NewYorkMedium-Regular", size: 16)
               
       if currentText.length >= 249 {
           textView.text = currentText.substring(to: 249)
           countLabel.text = "250/250"
       }
       return currentText.length <= 249
        
        
//        countLabel.text = "\(answerText.text.count + (newText.count - range.length))/250"
//        countLabel.textColor = darkGrey
//        countLabel.font = UIFont(name: "NewYorkMedium-Regular", size: 16)
//        return answerText.text.count + (newText.count - range.length) <= 249
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        view.endEditing(true)
        exitTutorial()
    }

    func exitTutorial() {
        if answerText.text.isEmpty {
            let generator = UINotificationFeedbackGenerator()
                   generator.notificationOccurred(.warning)
        }
        else {
            counter += 1
            performSegue(withIdentifier: "Evaluation Control", sender: self)
        }
    }
    
    func editAnswerText() {
        answerText.textAlignment = .left
        answerText.textColor = lightGrey
        answerText.font = UIFont(name: "NewYorkMedium-Regular", size: 18)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 24
        let attributes = [NSAttributedString.Key.paragraphStyle: style]
        answerText.attributedText = NSAttributedString(string: answerText.text, attributes: attributes)
    }
    
    func editButton() {
       nextButton.titleLabel?.font = UIFont(name: "NewYorkMedium-Regular", size: 25)
        nextButton.setTitleColor(buttonColor, for: .normal)
        nextButton.setTitle("Next", for: .normal)
    }
    
    func displayView() {
        if (counter <= 2) {
            questionLabel.textColor = darkGrey
            questionLabel.font = UIFont(name: "NewYorkMedium-Regular", size: 25)
            questionLabel.textAlignment = .left
            let style1 = NSMutableParagraphStyle()
            style1.lineSpacing = 28
            let attributes1 = [NSAttributedString.Key.paragraphStyle: style1]
            questionLabel.attributedText = NSAttributedString(string: questionLabel.text!, attributes: attributes1)
            questionLabel.text =  questionArray[counter].question
            progressView.image = questionArray[counter].progress
//            if (counter == 2) {
//               nextButton.setTitle("Done", for: .normal)
//            }
            }
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! TutorialEvaluationViewController).userAnswer = answerText.text
       }
}

