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
    
    var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.setTitle("Next", for: .normal)
        buttonPressed(self)
    }
    

    @IBAction func buttonPressed(_ sender: Any) {
        //counter += 1
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
}

