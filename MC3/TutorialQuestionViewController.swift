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
    @IBOutlet weak var answerText: UITextField!
    @IBOutlet weak var progressView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitle("Done", for: .highlighted)
        
    
        questionLabel.text = questionArray[counter].question
        questionArray[counter].answer = answerText.text ?? ""
        progressView.image = questionArray[counter].progress
        print(questionArray[counter].answer)

    }

    @IBAction func buttonPressed(_ sender: Any) {
        counter += 1
            if (counter == 2) {
                nextButton.isHighlighted = true
            }
            if (counter == 3) {
                performSegue(withIdentifier: "TutorialPageControl", sender: self)
            }
    }

}
