import Foundation
import UIKit

class TutorialEvaluationViewController: UIViewController {

    @IBOutlet weak var textAnswer: UITextView!
    @IBOutlet weak var essentialButton: UIButton!
    @IBOutlet weak var notEssentialButton: UIButton!
    @IBOutlet weak var labelView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!

    var timerSpEss = Timer()
    var timerSpNot = Timer()
    
    
    var userAnswer: String!
    var evaluation: String!

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
    
    func timerEssentialSpento(){
        var j = 1
        timerSpNot.invalidate()
        timerSpEss.invalidate()
        timerSpEss = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
           if(j >= 210){
                j = 1
            }
            self.essentialButton.setBackgroundImage(UIImage(named: "Rosa\(j)"), for: .normal)
                j += 1
                   }
        essentialButton.setImage(UIImage(named: "Essential Reflect"), for: .normal)
        notEssentialButton.setBackgroundImage(UIImage(named: "Spento1"), for: .normal)
         notEssentialButton.setImage(UIImage(named: "NonEssential"), for: .normal)
    }
    func timerNotEssentialSpento(){
        var j = 1
        timerSpEss.invalidate()
        timerSpNot.invalidate()
        timerSpNot =  Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
             if(j >= 210){
                  j = 1
              }
              self.notEssentialButton.setBackgroundImage(UIImage(named: "Verde\(j)"), for: .normal)
                  j += 1
                     }
        notEssentialButton.setImage(UIImage(named: "NonEssential Reflect"), for: .normal)
          essentialButton.setBackgroundImage(UIImage(named: "Spento1"), for: .normal)
        essentialButton.setImage(UIImage(named: "Essential"), for: .normal)
          
    }

    @IBAction func essentialButton(_ sender: Any) {
        let generator = UIImpactFeedbackGenerator(style: .medium)
               generator.impactOccurred()
        view.endEditing(true)
        evaluation = "essential"
        timerEssentialSpento()
        
       // nextMove()
    }

    @IBAction func notEssentialButton(_ sender: Any) {
        let generator = UIImpactFeedbackGenerator(style: .medium)
               generator.impactOccurred()
        view.endEditing(true)
        evaluation = "not-essential"
        timerNotEssentialSpento()
        
        
        //nextMove()
    }

    @IBAction func nextButton(_ sender: UIButton) {
        if(evaluation == "essential"){
            essentialCount += 1
            DatabaseHelper.istance.saveThoughtCoredata(text: userAnswer, evaluation: "essential")
        }else{
            notEssentialCount += 1
            DatabaseHelper.istance.saveThoughtCoredata(text: userAnswer, evaluation: "not-essential")
        }
        nextMove()
    }
    
    func nextMove() {
        count += 1
        if (count <= 2) {
            DispatchQueue.main.asyncAfter(deadline:.now(), execute: {
               self.performSegue(withIdentifier: "Next Question",sender: self)
            })
            
        }
        else if (count > 2) {
            DispatchQueue.main.asyncAfter(deadline:.now(), execute: {
               self.performSegue(withIdentifier: "Tutorial Well Done",sender: self)
            })
        }
    }
}
