import Foundation
import UIKit

class TutorialEvaluationViewController: UIViewController {

    @IBOutlet weak var textAnswer: UITextView!
    @IBOutlet weak var essentialButton: UIButton!
    @IBOutlet weak var notEssentialButton: UIButton!
    @IBOutlet weak var labelView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    
    
    var userAnswer: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 24
        let attributes = [NSAttributedString.Key.paragraphStyle: style]
        textAnswer.attributedText = NSAttributedString(string: textAnswer.text, attributes: attributes)
    }
    override func viewWillAppear(_ animated: Bool) {
        textAnswer.font = UIFont(name: "NewYorkMedium-Regular", size: 18)
        textAnswer.textAlignment = .center
        textAnswer.textColor = lightGrey
        textAnswer.text = userAnswer
        labelView.image = UIImage(named: "Reflect")
        nextButton.titleLabel?.font = UIFont(name: "NewYorkMedium-Regular", size: 25)
        nextButton.setTitleColor(buttonColor, for: .normal)
        nextButton.setTitle("Next", for: .normal)
    }

    @IBAction func essentialButton(_ sender: Any) {
        view.endEditing(true)
        essentialCount += 1
        DatabaseHelper.istance.saveThoughtCoredata(text: userAnswer, evaluation: "essential")
        nextMove()
    }

    @IBAction func notEssentialButton(_ sender: Any) {
        view.endEditing(true)
        notEssentialCount += 1
        DatabaseHelper.istance.saveThoughtCoredata(text: userAnswer, evaluation: "not-essential")
        nextMove()
    }


    func nextMove() {
        count += 1
        if (count <= 2) {
            DispatchQueue.main.asyncAfter(deadline:.now() + 1.0, execute: {
               self.performSegue(withIdentifier: "Next Question",sender: self)
            })
            
        }
        else if (count > 2) {
            DispatchQueue.main.asyncAfter(deadline:.now() + 1.0, execute: {
               self.performSegue(withIdentifier: "Tutorial Well Done",sender: self)
            })
        }
    }
}
