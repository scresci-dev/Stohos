import Foundation
import UIKit

class TutorialEvaluationViewController: UIViewController {

    @IBOutlet weak var textAnswer: UITextView!
    @IBOutlet weak var essentialButton: UIButton!
    @IBOutlet weak var notEssentialButton: UIButton!
    @IBOutlet weak var greyThought: UIImageView!
    
    var userAnswer: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        greyThought.image = UIImage(named: "neutral")
        textAnswer.text = userAnswer
        textAnswer.textAlignment = .center
        textAnswer.textColor = lightGrey
        textAnswer.font = UIFont(name: "NewYorkMedium-Regular", size: 18)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 24
        let attributes = [NSAttributedString.Key.paragraphStyle: style]
        textAnswer.attributedText = NSAttributedString(string: textAnswer.text, attributes: attributes)
        allAnswer.append(userAnswer)
    }

    @IBAction func essentialButton(_ sender: Any) {
        view.endEditing(true)
        essentialCount += 1
        DatabaseHelper.istance.saveThoughtCoredata(text: userAnswer, evaluation: "essential")
        greyThought.image = UIImage(named: "essential")
        nextMove()
    }

    @IBAction func notEssentialButton(_ sender: Any) {
        view.endEditing(true)
        notEssentialCount += 1
        DatabaseHelper.istance.saveThoughtCoredata(text: userAnswer, evaluation: "not-essential")
        greyThought.image = UIImage(named: "not-essential")
        nextMove()
    }


    func nextMove() {
        count += 1
        if (count <= 2) {
            DispatchQueue.main.asyncAfter(deadline:.now() + 2.0, execute: {
               self.performSegue(withIdentifier: "Next Question",sender: self)
            })}
        else if (count > 2) {
            DispatchQueue.main.asyncAfter(deadline:.now() + 2.0, execute: {
               self.performSegue(withIdentifier: "Tutorial Well Done",sender: self)
            })
        }
    }
}
