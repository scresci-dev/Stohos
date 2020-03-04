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
        editAnswerText()
        editButton()
        displayView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        answerText.becomeFirstResponder()
    }
    
   func textViewDidBeginEditing(_ textView: UITextView) {
       if textView.textColor == UIColor.lightGray {
           textView.text = nil
           textView.textColor = UIColor.black
       }
   }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText newText: String) -> Bool {
        return answerText.text.count + (newText.count - range.length) <= 250
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        view.endEditing(true)
        exitTutorial()
    }

    func exitTutorial() {
        counter += 1
        if answerText.text.isEmpty {
            let generator = UINotificationFeedbackGenerator()
                   generator.notificationOccurred(.warning)
        }
        else {
            performSegue(withIdentifier: "Evaluation Control", sender: self)
        }
    }
    
    func editAnswerText() {
        //answerText.layer.borderWidth = 1.0
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

