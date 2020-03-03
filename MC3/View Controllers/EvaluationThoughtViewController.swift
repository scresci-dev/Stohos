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
    @IBOutlet weak var thoughtView: UIImageView!
    @IBOutlet weak var ebutton: UIButton!
    @IBOutlet weak var nebutton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "greybackground.png")!)
        thoughtText.text = finalThought
        print(isUpdate)
    }
    
    @IBAction func essButton(_ sender: Any) {
        //change the image view to essential and delay 2 sec to see it
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
