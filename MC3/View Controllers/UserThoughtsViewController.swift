//
//  ThoughtsViewController.swift
//  MC3
//
//  Created by Gianna Stylianou on 26/2/20.
//  Copyright © 2020 Gianna Stylianou. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import CoreMotion

class UserThoughtsViewController: UIViewController {

    var currentThought: String = " "
    var newThought: String = " "
    
    var timer = Timer()
    
    var start : [Int] = []
    
    var numThoughts = 0
    var numEssential = essentialCount
    var numNotEssential = notEssentialCount
    
    var arr: [Thought] = [];
    
    @IBOutlet weak var thoughtView: UITextView!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var Barriera: UIImageView!
    @IBOutlet weak var BarrieraTop: UIImageView!
    @IBOutlet weak var plantButton: UIButton!
    
        var collision : UICollisionBehavior!
        var animator : UIDynamicAnimator!
        var gravity: UIGravityBehavior!
        var motionManager = CMMotionManager()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            overrideUserInterfaceStyle = .light
            start = [0, 22, 34, 43, 57, 70, 90, 104, 125, 142]
            editButton.titleLabel?.font = UIFont(name: "NewYorkMedium-Regular", size: 18)
            editButton.setTitleColor(buttonColor, for: .normal)
            deleteButton.titleLabel?.font = UIFont(name: "NewYorkMedium-Regular", size: 20)
            deleteButton.setTitleColor(buttonColor, for: .normal)
            thoughtView.textColor = lightGrey
            allAnswer.append(currentThought)
            displayTree()
            
            // Do any additional setup after loading the view.
            animator = UIDynamicAnimator(referenceView: view)
            gravity = UIGravityBehavior(items: [])
            gravity.gravityDirection = CGVector(dx: 0, dy: 0)
            animator.addBehavior(gravity)
            self.collision = UICollisionBehavior(items: [])
            self.collision.translatesReferenceBoundsIntoBoundary = true
            self.collision.addBoundary(withIdentifier: "Barrier1" as NSCopying, for: UIBezierPath(rect: Barriera.frame))
            self.collision.addBoundary(withIdentifier: "Barrier2" as NSCopying, for: UIBezierPath(rect: BarrieraTop.frame))
            self.animator.addBehavior(self.collision)
//            DoppiaPalla.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(TextAppear)))
            

        }
    
     
     @objc func changeImg(button: UIButton, n: Int, state: String){
         if(state == "essential"){
            button.setImage(UIImage(named: "pink\(n)"), for: .normal)
         } else{
             button.setImage(UIImage(named: "blue\(n)"), for: .normal)
         }
        }
    
    override func viewWillAppear(_ animated: Bool) {
        arr = DatabaseHelper.istance.getAllThoughts()

        
        for i in 0..<arr.count{
            
          let SubView = UIView()
          let button = UIButton()
    
          SubView.addSubview(button)
    
            if(arr[i].evaluation == "essential"){
                numEssential += 1
                numThoughts += 1
                button.frame = CGRect(x: -15, y: -15, width: 150, height: 150)
                button.tag = i;
                button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
                
                SubView.frame = CGRect(x: 222, y: 60, width: 120, height: 120)
                      DispatchQueue.main.async {
                          self.collision.addItem(SubView)
                          self.gravity.addItem(SubView)
                      }
                  Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                             if(self.start[self.numThoughts] >= 162){
                                            self.start[self.numThoughts] = 1
                                        }
                      self.changeImg(button: button, n: self.start[self.numThoughts], state: "essential")
//                            print(self.randomNumbers[self.numThoughts])
                             self.start[self.numThoughts] += 1

                         }
            }else{
                numNotEssential += 1
                numThoughts += 1
               
                button.frame = CGRect(x: -15, y: -15, width: 120, height: 120)
                button.tag = i;
                button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
                
                SubView.frame = CGRect(x: 222, y: 60, width: 90, height: 90)
                      DispatchQueue.main.async {
                          self.collision.addItem(SubView)
                          self.gravity.addItem(SubView)
                      }
                
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                                          if(self.start[self.numThoughts] >= 253){
                                                         self.start[self.numThoughts] = 1
                                                     }
                                   self.changeImg(button: button, n: self.start[self.numThoughts], state: "not-essential")
                                          self.start[self.numThoughts] += 1

                                      }
            }
        
                  view.addSubview(SubView)
        }
        
        motionManager.gyroUpdateInterval = 1.0 / 60.0
        motionManager.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
            if let _ = data
            {
                let x = (data?.rotationRate.x ?? 0.0)
                let y = (data?.rotationRate.y ?? 0.0)
                
                
                self.gravity.gravityDirection = CGVector(dx: y*0.1, dy: 0)
                
            }
    }

    }
    
    @objc func buttonClicked(_ sender: UIButton){
        thoughtView.text = arr[sender.tag].text
        deleteButton.isEnabled = true
        deleteButton.isHidden = false
        editButton.isEnabled = true
        editButton.isHidden = false
    }

        
    func displayTree() {
        
        print(numEssential)
                       print(numNotEssential)
        
        if (numEssential > numNotEssential) {
            plantButton.setImage(UIImage(named: "plant3"), for: .normal)
        }
        else if (numEssential < numNotEssential) {
           plantButton.setImage(UIImage(named: "plant1"), for: .normal)
        }
        else {
            plantButton.setImage(UIImage(named: "plant2"), for: .normal)
        }
    }
    
    @IBAction func plantIsPressed(_ sender: Any) {
        deleteButton.isHidden = true
        deleteButton.isEnabled = false
        
        thoughtView.font = UIFont(name: "NewYorkMedium-Regular", size: 16)
        thoughtView.textAlignment = .center
        thoughtView.textColor = lightGrey
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        if numNotEssential > numEssential {
            thoughtView.text = "Try to let go of some of your non-essential thoughts and collect more essential ones"
        }
        else if numNotEssential < numEssential {
            thoughtView.text = "Well done! You have freed yourself from most of your non-essential thoughts."
        }
        else {
            thoughtView.text = "You are doing great! Keep decluttering your mind to stay productive, motivated and focused"
        }
    }
    
    
    @IBAction func editButton(_ sender: Any) {
        performSegue(withIdentifier: "Edit Thought", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Edit Thought") {
            (segue.destination as! EditThoughtViewController).editedUserThought = thoughtView.text
        }
    }
}
