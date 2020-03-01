import Foundation
import UIKit

class TutorialEvaluationViewController: UIViewController {

    @IBOutlet weak var textAnswer: UITextView!
    @IBOutlet weak var essentialView: UIImageView!
    @IBOutlet weak var notEssentialView: UIImageView!
    @IBOutlet weak var essentialButton: UIButton!
    @IBOutlet weak var notEssentialButton: UIButton!

    var userAnswer: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        textAnswer.text = userAnswer
        allAnswer.append(userAnswer)
    }

    @IBAction func essentialButton(_ sender: Any) {
        view.endEditing(true)
        essentialCount += 1
        arrayCheck.append("essential")
        nextMove()
    }

    @IBAction func notEssentialButton(_ sender: Any) {
        view.endEditing(true)
        notEssentialCount += 1
        arrayCheck.append("not-essential")
        nextMove()
    }


    func nextMove() {
        count += 1
        if (count <= 2) {
            performSegue(withIdentifier: "Next Question", sender: self) }
        else if (count > 2) {
            performSegue(withIdentifier: "Tutorial Well Done", sender: self)
        }
    }
}
