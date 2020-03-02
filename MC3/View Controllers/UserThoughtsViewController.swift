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
    
    let image1 = UIImage(named: "\(arrayCheck[0])")
    let image2 = UIImage(named: "\(arrayCheck[1])")
    let image3 = UIImage(named: "\(arrayCheck[2])")
    
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
                  displayMainView()
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
            
    //        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(changeImg(button: pensiero1, start:4)), userInfo: nil, repeats: true)
//            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
//                if(self.randomNumbers[0] == 162){
//                    self.randomNumbers[0] = 1
//                }
//                self.changeImg(button: self.pensiero1, n: self.randomNumbers[0], state: "essential")
//                self.randomNumbers[0] += 1
//            }
//            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
//                if(self.randomNumbers[1] == 253){
//                               self.randomNumbers[1] = 1
//                           }
//                self.changeImg(button: self.pensiero2, n: self.randomNumbers[1], state: "not essential")
//                self.randomNumbers[1] += 1
//            }
//            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
//                if(self.randomNumbers[2] == 162){
//                               self.randomNumbers[2] = 1
//                           }
//                self.changeImg(button: self.pensiero3, n: self.randomNumbers[2], state: "essential")
//                self.randomNumbers[2] += 1
//
//            }
//            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
//                if(self.randomNumbers[3] == 253){
//                               self.randomNumbers[3] = 1
//                           }
//                self.changeImg(button: self.pensiero4, n: self.randomNumbers[3], state: "not essential")
//                self.randomNumbers[3] += 1
//
//            }
//            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
//                if(self.randomNumbers[4] == 162){
//                               self.randomNumbers[4] = 1
//                           }
//                self.changeImg(button: self.pensiero5, n: self.randomNumbers[4], state: "essential")
//                self.randomNumbers[4] += 1
//
//            }
//            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
//                if(self.randomNumbers[5] == 162){
//                               self.randomNumbers[5] = 1
//                           }
//                self.changeImg(button: self.pensiero6, n: self.randomNumbers[5], state: "essential")
//                self.randomNumbers[5] += 1
//
//            }
//            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
//                if(self.randomNumbers[6] == 253){
//                               self.randomNumbers[6] = 1
//                           }
//                self.changeImg(button: self.pensiero7, n: self.randomNumbers[6], state: "not essential")
//                self.randomNumbers[6] += 1
//
//            }

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
    
    func displayMainView() {
        button1.setImage(image1, for: .normal)
        button1.frame = CGRect(x: 30, y: 200, width: 100, height: 100)
        button2.setImage(image2, for: .normal)
        button2.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
        button3.setImage(image3, for: .normal)
        button3.frame = CGRect(x: 200, y: 300, width: 100, height: 100)
    }
    
    @IBAction func press1(_ sender: Any) {
        thoughtView.text = allAnswer[0]
        currentThought = allAnswer[0]
    }
    
    @IBAction func press2(_ sender: Any) {
        thoughtView.text = allAnswer[1]
        currentThought = allAnswer[1]
    }
    
    @IBAction func press3(_ sender: Any) {
        thoughtView.text = allAnswer[2]
        currentThought = allAnswer[2]
    }

    
    @IBAction func editButton(_ sender: Any) {
        performSegue(withIdentifier: "Edit Thought", sender: self)
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        if (button1.isTouchInside == true) {
            button1.isHidden = true
        }
        else if (button2.isTouchInside == true) {
            button2.isHidden = true
        }
        else if (button3.isTouchInside == true) {
            button3.isHidden = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Edit Thought") {
            (segue.destination as! EditThoughtViewController).editedUserThought = currentThought
        }
//        if (segue.identifier == "Add Thought") {
//            (segue.destination as! AddThoughtViewController).
//        }
    }
}
