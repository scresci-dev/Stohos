import Foundation
import UIKit

class TutorialEvaluationViewController: UIViewController {

    @IBOutlet weak var textAnswer: UITextView!
    @IBOutlet weak var essentialButton: UIButton!
    @IBOutlet weak var notEssentialButton: UIButton!
    @IBOutlet weak var labelView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    var timerEss = Timer()
    var timerNot = Timer()
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
        essentialButton.setImage(UIImage(named: "Essential Reflect"), for: .normal)
        notEssentialButton.setImage(UIImage(named: "NonEssential Reflect"), for: .normal)

        timerEssentialSpento()
        
        
        
    }
    
    func timerEssentialSpento(){
        var j = 0
        timerEss.invalidate()
        timerSpNot.invalidate()
        timerNotEssential()
        timerSpEss = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
           if(j >= 210){
                j = 1
            }
            self.essentialButton.setBackgroundImage(UIImage(named: "Rosa\(j)"), for: .normal)
                j += 1
                   }
    }
    func timerNotEssentialSpento(){
        var j = 0
          timerNot.invalidate()
          timerSpEss.invalidate()
        timerEssential()
        timerSpNot =  Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
             if(j >= 210){
                  j = 1
              }
              self.notEssentialButton.setBackgroundImage(UIImage(named: "Verde\(j)"), for: .normal)
                  j += 1
                     }
          
    }
    func timerEssential(){
        var j = 0
        timerEss = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
           if(j >= 210){
                j = 1
            }
            self.essentialButton.setBackgroundImage(UIImage(named: "Spento\(j)"), for: .normal)
                j += 1
                   }
    }
    func timerNotEssential(){
        var p = 0
        timerNot = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
           if(p >= 210){
                p = 1
            }
            self.notEssentialButton.setBackgroundImage(UIImage(named: "Spento\(p)"), for: .normal)
                p += 1
                   }
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
