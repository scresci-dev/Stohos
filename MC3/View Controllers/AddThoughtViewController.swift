//
//  AddUserThought.swift
//  MC3
//
//  Created by Gianna Stylianou on 28/2/20.
//  Copyright © 2020 Gianna Stylianou. All rights reserved.
//

import Foundation
import UIKit

class AddThoughtViewController: UIViewController {
    
    @IBOutlet weak var newThought: UITextView!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "greybackground.png")!)
        doneButton.titleLabel?.font = UIFont(name: "NewYorkMedium-Regular", size: 25)
        doneButton.setTitleColor(buttonColor, for: .normal)
        doneButton.setTitle("Done", for: .normal)
        newThought.textAlignment = .center
        newThought.textColor = lightGrey
        newThought.font = UIFont(name: "NewYorkMedium-Regular", size: 18)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 24
        let attributes = [NSAttributedString.Key.paragraphStyle: style]
        newThought.attributedText = NSAttributedString(string: newThought.text, attributes: attributes)
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText newText: String) -> Bool {
           return newThought.text.count + (newText.count - range.length) <= 250
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     (segue.destination as! EvaluationThoughtViewController).finalThought = newThought.text
    }
    
    
}
