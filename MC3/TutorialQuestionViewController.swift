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
    
    var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerText.layer.borderWidth = 1.0
        nextButton.setTitle("Next", for: .normal)
        buttonPressed(self)
    }

    @IBAction func buttonPressed(_ sender: Any) {
        exitTutorial()
        counter += 1
    }

    func exitTutorial() {
        if (counter > 3 ) {
            performSegue(withIdentifier: "TutorialPageControl", sender: self)
        }
        else {
        questionLabel.text = questionArray[counter].question
        questionArray[counter].answer = answerText.text ?? ""
        progressView.image = questionArray[counter].progress
        print(questionArray[counter].answer)
        print(counter)
        if (counter == 3) {
            nextButton.setTitle("Done", for: .normal)
        }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! EvaluationViewController).userAnswer = answerText.text
        (segue.destination as! EvaluationViewController).count = counter
           // Get the new view controller using segue.destination.
           // Pass the selected object to the new view controller.
       }
}

