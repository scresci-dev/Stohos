//
//  MainViewController.swift
//  MC3
//
//  Created by Gianna Stylianou on 29/2/20.
//  Copyright © 2020 Gianna Stylianou. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class EvaluationThoughtViewController: UIViewController {
    
    var finalThought = String()
    var isUpdate = String()
    var oldText = String()
    
    var timerSpEss = Timer()
    var timerSpNot = Timer()
    
    var modeSelected = String()
    
    @IBOutlet weak var thoughtText: UITextView!
    @IBOutlet weak var ebutton: UIButton!
    @IBOutlet weak var nebutton: UIButton!
    @IBOutlet weak var questionmarkButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(view.frame.width == 375){
            for constraint in ebutton.constraints {
                if constraint.identifier == "essentialWidth"{
                    constraint.constant = 170
                }
                if constraint.identifier == "essentialHeight"{
                    constraint.constant = 170
                }
            }
            ebutton.layoutIfNeeded()
            
            for constraint in nebutton.constraints {
                if constraint.identifier == "notEssentialWidth"{
                    constraint.constant = 170
                }
                if constraint.identifier == "notEssentialHeight"{
                    constraint.constant = 170
                }
            }
            nebutton.layoutIfNeeded()

        }
        overrideUserInterfaceStyle = .light
        thoughtText.text = finalThought
        thoughtText.font = UIFont(name: "NewYorkMedium-Regular", size: 18)
        thoughtText.textAlignment = .center
        thoughtText.textColor = lightGrey
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
            self.ebutton.setBackgroundImage(UIImage(named: "Rosa\(j)"), for: .normal)
                j += 1
                   }
        nebutton.setBackgroundImage(UIImage(named: "Spento1"), for: .normal)
        ebutton.setImage(UIImage(named: "Essential Reflect"), for: .normal)
        nebutton.setImage(UIImage(named: "NonEssential"), for: .normal)
        
    }
    func timerNotEssentialSpento(){
        var j = 1
        timerSpEss.invalidate()
        timerSpNot.invalidate()
        timerSpNot =  Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
             if(j >= 210){
                  j = 1
              }
              self.nebutton.setBackgroundImage(UIImage(named: "Verde\(j)"), for: .normal)
                  j += 1
                     }
          ebutton.setBackgroundImage(UIImage(named: "Spento1"), for: .normal)
        nebutton.setImage(UIImage(named: "NonEssential Reflect"), for: .normal)
        ebutton.setImage(UIImage(named: "Essential"), for: .normal)
          
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func essButton(_ sender: Any) {
        //change the image view to essential and delay 2 sec to see it
        let generator = UIImpactFeedbackGenerator(style: .medium)
               generator.impactOccurred()
        modeSelected = "essential"
        timerEssentialSpento()
    }
    
    @IBAction func notEssButton(_ sender: Any) {
        //change the image view to not essential and delay 2 sec to see it
        let generator = UIImpactFeedbackGenerator(style: .medium)
               generator.impactOccurred()
        modeSelected = "not-essential"
        timerNotEssentialSpento()
    }
    
    @IBAction func nextButtonFunc(_ sender: UIButton) {
        if(modeSelected != ""){
            if(isUpdate == "no"){
                 DatabaseHelper.istance.saveThoughtCoredata(text: finalThought, evaluation: modeSelected)
            } else{
                DatabaseHelper.istance.updateThoughts(oldText: oldText, newText: finalThought, newEvaluation: modeSelected)
        }
        modeSelected = ""
        performSegue(withIdentifier: "Main View", sender: self)
        } else{
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.warning)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Main View") {
        (segue.destination as! UserThoughtsViewController).newThought = thoughtText.text
        }
    }
}
