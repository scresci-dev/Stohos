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
    
    @IBOutlet weak var thoughtText: UITextView!
    @IBOutlet weak var ebutton: UIButton!
    @IBOutlet weak var nebutton: UIButton!
    @IBOutlet weak var questionmarkButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        thoughtText.text = finalThought
        thoughtText.font = UIFont(name: "NewYorkMedium-Regular", size: 18)
        thoughtText.textAlignment = .center
        thoughtText.textColor = lightGrey
        nextButton.titleLabel?.font = UIFont(name: "NewYorkMedium-Regular", size: 25)
        nextButton.setTitleColor(buttonColor, for: .normal)
        nextButton.setTitle("Next", for: .normal)
        print(isUpdate)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func essButton(_ sender: Any) {
        //change the image view to essential and delay 2 sec to see it
        let generator = UIImpactFeedbackGenerator(style: .medium)
               generator.impactOccurred()
        if(isUpdate == "no"){
        DatabaseHelper.istance.saveThoughtCoredata(text: finalThought, evaluation: "essential")
        }else{
            print(finalThought)
            print("old: \(oldText)")
            DatabaseHelper.istance.updateThoughts(oldText: oldText, newText: finalThought, newEvaluation: "essential")
        }
        performSegue(withIdentifier: "Main View", sender: self)
    }
    
    @IBAction func notEssButton(_ sender: Any) {
        //change the image view to not essential and delay 2 sec to see it
        let generator = UIImpactFeedbackGenerator(style: .medium)
               generator.impactOccurred()
        if(isUpdate == "no"){
        DatabaseHelper.istance.saveThoughtCoredata(text: finalThought, evaluation: "not-essential")
        }else{
            DatabaseHelper.istance.updateThoughts(oldText: oldText, newText: finalThought, newEvaluation: "not-essential")
        }
        performSegue(withIdentifier: "Main View", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     (segue.destination as! UserThoughtsViewController).newThought = thoughtText.text
    }
}
