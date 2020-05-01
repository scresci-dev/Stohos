import Foundation
import UIKit

class TutorialEvaluationViewController: UIViewController {

    @IBOutlet weak var textAnswer: UITextView!
    @IBOutlet weak var essentialButton: UIButton!
    @IBOutlet weak var notEssentialButton: UIButton!
    @IBOutlet weak var labelView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var info: UIButton!
    
    var timerSpEss = Timer()
    var timerSpNot = Timer()
    var isPressed = false


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

        if(view.frame.width == 375){
            if(view.frame.height <= 736){
//                iphone 8 e 8Plus
                for constraint in essentialButton.constraints {
                    if constraint.identifier == "essentialWidth"{
                        constraint.constant = 160
                    }
                    if constraint.identifier == "essentialHeight"{
                        constraint.constant = 160
                    }
                }
                essentialButton.layoutIfNeeded()
                
                for constraint in notEssentialButton.constraints {
                    if constraint.identifier == "notEssentialWidth"{
                        constraint.constant = 160
                    }
                    if constraint.identifier == "notEssentialHeight"{
                        constraint.constant = 160
                    }
                }
                notEssentialButton.layoutIfNeeded()
                
                for constraint in nextButton.constraints {
                    if constraint.identifier == "dio"{
                        constraint.constant = 45
                    }
                }
                nextButton.layoutIfNeeded()
                
                for constraint in textAnswer.constraints {
                    if constraint.identifier == "altezza"{
                        constraint.constant = 150
                    }
                }
                textAnswer.layoutIfNeeded()
    
                for constraint in labelView.constraints {
                    if constraint.identifier == "susu"{
                        constraint.constant = 20
                    }
                }
                labelView.layoutIfNeeded()
               
                for constraint in info.constraints {
                    if constraint.identifier == "susu"{
                        constraint.constant = 20
                    }
                }
                info.layoutIfNeeded()
                
            } else{
            for constraint in essentialButton.constraints {
                if constraint.identifier == "essentialWidth"{
                    constraint.constant = 170
                }
                if constraint.identifier == "essentialHeight"{
                    constraint.constant = 170
                }
            }
            essentialButton.layoutIfNeeded()
            
            for constraint in notEssentialButton.constraints {
                if constraint.identifier == "notEssentialWidth"{
                    constraint.constant = 170
                }
                if constraint.identifier == "notEssentialHeight"{
                    constraint.constant = 170
                }
            }
            notEssentialButton.layoutIfNeeded()
            }
        }
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
        isPressed = true
        timerEssentialSpento()
        
       // nextMove()
    }

    @IBAction func notEssentialButton(_ sender: Any) {
        let generator = UIImpactFeedbackGenerator(style: .medium)
               generator.impactOccurred()
        view.endEditing(true)
        evaluation = "not-essential"
        isPressed = true
        timerNotEssentialSpento()
        
        
        //nextMove()
    }

    @IBAction func nextButton(_ sender: UIButton) {
        if(isPressed){
            isPressed = false
            count += 1
            if(count == 1){
                thought1Text = userAnswer
                thought1Evaluation = evaluation
            } else if(count == 2){
                thought2Text = userAnswer
                thought2Evaluation = evaluation
            } else{
                DatabaseHelper.istance.saveThoughtCoredata(text: thought1Text, evaluation: thought1Evaluation)
                DatabaseHelper.istance.saveThoughtCoredata(text: thought2Text, evaluation: thought2Evaluation)
                DatabaseHelper.istance.saveThoughtCoredata(text: userAnswer, evaluation: evaluation)
            }
            nextMove()
        }else{
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.warning)
        }
    }
    
    func nextMove() {
        
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
