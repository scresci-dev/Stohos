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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "greybackground.png")!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     (segue.destination as! EvaluationThoughtViewController).finalThought = newThought.text
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText newText: String) -> Bool {
        let currentText:String = textView.text
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: newText)
        if updatedText.isEmpty {

            textView.text = "Write here..."
            textView.textColor = UIColor.lightGray

            textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
        }
        else if textView.textColor == UIColor.lightGray && !newText.isEmpty {
            textView.textColor = UIColor.black
            textView.text = newText
        }
        return newThought.text.count + (newText.count - range.length) <= 250
    }
}
