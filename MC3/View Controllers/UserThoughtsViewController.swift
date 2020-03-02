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
    
    var essentialThoughtCount: Int = 0
    var notEssentialThoughtCount: Int = 0
    var currentThought: String = " "
    var newThought: String = " "
    
    var timer = Timer()
    
    var randomNumbers : [Int] = [Int.random(in: 1...200),Int.random(in: 1...200),Int.random(in: 1...200),Int.random(in: 1...200),Int.random(in: 1...200),Int.random(in: 1...200),Int.random(in: 1...200),Int.random(in: 1...200),Int.random(in: 1...200),Int.random(in: 1...200)]
    
    var numThoughts: Int = 0
    
    var arr: [Thought] = [];
    
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var thoughtView: UITextView!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var treeImage: UIImageView!
    @IBOutlet weak var Barriera: UIImageView!
    @IBOutlet weak var BarrieraTop: UIImageView!
    
        var collision : UICollisionBehavior!
        var animator : UIDynamicAnimator!
         var gravity: UIGravityBehavior!
        var motionManager = CMMotionManager()
        override func viewDidLoad() {
            super.viewDidLoad()
            essentialThoughtCount = essentialCount
                  notEssentialThoughtCount = notEssentialCount
                  editButton.setTitleColor(darkGrey, for: .normal)
                  deleteButton.setTitleColor(darkGrey, for: .normal)
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
                
                button.frame = CGRect(x: -15, y: -15, width: 150, height: 150)
                button.tag = i;
                button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
                
                SubView.frame = CGRect(x: 222, y: 40, width: 120, height: 120)
                      DispatchQueue.main.async {
                          self.collision.addItem(SubView)
                          self.gravity.addItem(SubView)
                      }
                  Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                             if(self.randomNumbers[self.numThoughts] == 162){
                                            self.randomNumbers[self.numThoughts] = 1
                                        }
                      self.changeImg(button: button, n: self.randomNumbers[self.numThoughts], state: "essential")
                             self.randomNumbers[self.numThoughts] += 1

                         }
            }else{
                
                button.frame = CGRect(x: -15, y: -15, width: 120, height: 120)
                button.tag = i;
                button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
                
                SubView.frame = CGRect(x: 222, y: 40, width: 90, height: 90)
                      DispatchQueue.main.async {
                          self.collision.addItem(SubView)
                          self.gravity.addItem(SubView)
                      }
                
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                                          if(self.randomNumbers[self.numThoughts] == 253){
                                                         self.randomNumbers[self.numThoughts] = 1
                                                     }
                                   self.changeImg(button: button, n: self.randomNumbers[self.numThoughts], state: "not-essential")
                                          self.randomNumbers[self.numThoughts] += 1

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

    }

        
    func displayTree() {
        if (essentialThoughtCount > notEssentialThoughtCount) {
            treeImage.image = UIImage(named: "plant3")
        }
        else if (essentialThoughtCount < notEssentialThoughtCount) {
            treeImage.image = UIImage(named: "plant1")
        }
        else {
            treeImage.image = UIImage(named: "plant2")
        }
    }
    
    @IBAction func editButton(_ sender: Any) {
        performSegue(withIdentifier: "Edit Thought", sender: self)
    }
    
//    @IBAction func deleteAction(_ sender: Any) {
//        if (button1.isTouchInside == true) {
//            button1.isHidden = true
//        }
//        else if (button2.isTouchInside == true) {
//            button2.isHidden = true
//        }
//        else if (button3.isTouchInside == true) {
//            button3.isHidden = true
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Edit Thought") {
            (segue.destination as! EditThoughtViewController).editedUserThought = currentThought
        }
//        if (segue.identifier == "Add Thought") {
//            (segue.destination as! AddThoughtViewController).
//        }
    }
}
