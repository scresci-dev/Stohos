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

    var currentThought: String = ""
    var newThought: String = ""
    var evaluation = String()
    
    var n = Int()
    
    var timer = Timer()
    var flag = true
    var start : [Int] = []
    var x : CGFloat = 20
    var y : CGFloat = 20
    
    var numThoughts = 0
    var numQuotes = plantArray.count
    
    var isUpdate : String = ""
    
    var indexes = [Int]();
    var arr: [Thought] = [];
    
    @IBOutlet weak var thoughtView: UITextView!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var Barriera: UIImageView!
    @IBOutlet weak var BarrieraTop: UIImageView!
    @IBOutlet weak var BarrieraRight: UIImageView!
    @IBOutlet weak var BarrieraLeft: UIImageView!
    @IBOutlet weak var plantButton: UIButton!
    @IBOutlet weak var plantLabel: UILabel!
    
    var frameWidth = CGFloat()
    var frameHeight = CGFloat()
    var blobWidth = CGFloat()
    var blobHeight = CGFloat()
    var plusWidth = CGFloat()
    var plusHeight = CGFloat()

    
        var collision : UICollisionBehavior!
        var animator : UIDynamicAnimator!
        var gravity: UIGravityBehavior!
        var motionManager = CMMotionManager()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            overrideUserInterfaceStyle = .light
            
            //iPhone 8 and 8 plus
            if(view.frame.height >= 667 && view.frame.height <= 736){
                frameWidth = 90
                frameHeight = 90
                blobWidth = 110
                blobHeight = 110
                plusWidth = 65.4
                plusHeight = 103
            } //iPhone X and XS
            else if(view.frame.height > 736 && view.frame.height <= 812){
                frameWidth = 110
                frameHeight = 110
                blobWidth = 130
                blobHeight = 130
                plusWidth = 75.4
                plusHeight = 113
            }else{
                frameWidth = 120
                frameHeight = 120
                blobWidth = 140
                blobHeight = 140
                plusWidth = 85.4
                plusHeight = 123
            }
        
            start = [0, 22, 34, 43, 57, 70, 90, 104, 125, 142]
            editButton.isHidden = true
            editButton.titleLabel?.font = UIFont(name: "NewYorkMedium-Regular", size: 18)
            editButton.setTitleColor(buttonColor, for: .normal)
            deleteButton.isHidden = true
            deleteButton.titleLabel?.font = UIFont(name: "NewYorkMedium-Regular", size: 20)
            deleteButton.setTitleColor(buttonColor, for: .normal)
            thoughtView.font = UIFont(name: "NewYorkMedium-Regular", size: 18)
             thoughtView.textAlignment = .center
             thoughtView.textColor = lightGrey
            
            // Do any additional setup after loading the view.
            animator = UIDynamicAnimator(referenceView: view)
            gravity = UIGravityBehavior(items: [])
            gravity.gravityDirection = CGVector(dx: 0, dy: 0)
            animator.addBehavior(gravity)
            self.collision = UICollisionBehavior(items: [])
            self.collision.translatesReferenceBoundsIntoBoundary = true
            self.collision.addBoundary(withIdentifier: "Barrier1" as NSCopying, for: UIBezierPath(rect: Barriera.frame))
            self.collision.addBoundary(withIdentifier: "Barrier2" as NSCopying, for: UIBezierPath(rect: BarrieraTop.frame))
            self.collision.addBoundary(withIdentifier: "Barrier3" as NSCopying, for: UIBezierPath(rect: BarrieraRight.frame))
            self.collision.addBoundary(withIdentifier: "Barrier4" as NSCopying, for: UIBezierPath(rect: BarrieraLeft.frame))
            self.animator.addBehavior(self.collision)
            let gestureRec = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
            view.addGestureRecognizer(gestureRec)
    }
    
    @objc func someAction(_ sender:UITapGestureRecognizer) {
        plantLabel.isHidden = true
    }
    
     
     @objc func changeImg(button: UIButton, n: Int, state: String){
         if(state == "essential"){
            button.setImage(UIImage(named: "Rosa\(n)"), for: .normal)
         } else{
             button.setImage(UIImage(named: "Verde\(n)"), for: .normal)
         }
        }
    
    override func viewWillAppear(_ animated: Bool) {

        arr.removeAll()
        arr = DatabaseHelper.istance.getAllThoughts()
        
        if n == 0{
        }else{
            plantLabel.isHidden = false
            thoughtView.isHidden = true
            deleteButton.isHidden = true
            deleteButton.isEnabled = false
            editButton.isEnabled = false
            editButton.isHidden = true
            plantLabel.textAlignment = .center
            plantLabel.font = UIFont(name: "NewYorkMedium-Regular", size: 16)
            plantLabel.textColor = lightGrey
            plantLabel.text = randomItem()
//           if (plantCounter < 21) {
//               plantLabel.text = plantArray[plantCounter].text
//               plantCounter += 1
//           } else {
//               plantCounter = 0
//           }
           let generator = UIImpactFeedbackGenerator(style: .light)
           generator.impactOccurred()
            
            n = 0
        }
        
        for i in 0..<arr.count{
        
            
          let SubView = UIView()
          let button = UIButton()
            

          SubView.addSubview(button)

            if(arr[i].evaluation == "essential"){
                numThoughts += 1
                button.frame = CGRect(x: -10, y: -10, width: blobWidth, height: blobHeight)
                button.tag = i;
                button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
                
               if(i<3){
                            SubView.frame = CGRect(x: x, y: y, width: frameWidth, height: frameHeight)
                            x+=130
                            if(i==2){
                                x = 20;
                                y = 120;
                            }
                        }else if(i>=3 && i<6){
                            SubView.frame = CGRect(x: x, y: y, width: frameWidth, height: frameHeight)
                            x+=130
                            if(i==5){
                                x = 20;
                                y = 220;
                            }
                        }else if(i>=6 && i<9){
                            SubView.frame = CGRect(x: x, y: y, width: frameWidth, height: frameHeight)
                            x+=130
                            if(i==8){
                                x = 20;
                                y = 320;
                            }
                            
                        }else{
                            SubView.frame = CGRect(x: x, y: y, width: frameWidth, height: frameHeight)
                
                        }
                      DispatchQueue.main.async {
                          self.collision.addItem(SubView)
                          self.gravity.addItem(SubView)
                      }
                  Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                    if(self.start[button.tag] >= 211){
                                            self.start[button.tag] = 1
                                        }
                      self.changeImg(button: button, n: self.start[button.tag], state: "essential")
                             self.start[button.tag] += 1

                         }
            }else{
                numThoughts += 1
               
                button.frame = CGRect(x: -15, y: -15, width: blobWidth - 20, height: blobHeight - 20)
                button.tag = i;
                button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
                if(i<3){
                    SubView.frame = CGRect(x: x, y: y, width: frameWidth - 30, height: frameHeight - 30)
                    x+=130
                    if(i==2){
                        x = 20;
                        y = 120;
                    }
                }else if(i>=3 && i<6){
                    SubView.frame = CGRect(x: x, y: y, width: frameWidth - 30, height: frameHeight - 30)
                    x+=130
                    if(i==5){
                        x = 20;
                        y = 220;
                    }
                }else if(i>=6 && i<9){
                    SubView.frame = CGRect(x: x, y: y, width: frameWidth - 30, height: frameHeight - 30)
                    x+=130
                    if(i==8){
                        x = 20;
                        y = 320;
                    }
                    
                }else{
                    SubView.frame = CGRect(x: x, y: y, width: frameWidth - 30, height: frameHeight - 30)
        
                }

                      DispatchQueue.main.async {
                          self.collision.addItem(SubView)
                          self.gravity.addItem(SubView)
                      }
                
                Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                   if(self.start[button.tag] >= 211){
                          self.start[button.tag] = 1
                                     }
                   self.changeImg(button: button, n: self.start[button.tag], state: "not-essential")
                          self.start[button.tag] += 1

                                      }
            }
            
                  view.addSubview(SubView)
        }
        let addButton = UIButton()
        addButton.frame = CGRect(x: view.frame.width / 1.16, y: view.frame.height/7.168, width: plusWidth, height: plusHeight)
        addButton.addTarget(self, action: #selector(addButtonFunc), for: .touchUpInside)
        addButton.setImage(UIImage(named: "AddButton"), for: .normal)

        view.addSubview(addButton)

        
        motionManager.gyroUpdateInterval = 1.0 / 60.0
        motionManager.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
            if let _ = data
            {
                _ = (data?.rotationRate.x ?? 0.0)
                let y = (data?.rotationRate.y ?? 0.0)
                
                
                self.gravity.gravityDirection = CGVector(dx: y*0.1, dy: 0)
                
            }
    }

    }
    
    
    @objc func buttonClicked(_ sender: UIButton){
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        thoughtView.text = arr[sender.tag].text
        deleteButton.isHidden = false
        deleteButton.isEnabled = true
        editButton.isHidden = false
        editButton.isEnabled = true
        thoughtView.isHidden = false
        plantLabel.isHidden = true
    }

    
    @IBAction func plantIsPressed(_ sender: Any) {
        plantLabel.isHidden = false
        thoughtView.isHidden = true
        deleteButton.isHidden = true
        deleteButton.isEnabled = false
        editButton.isEnabled = false
        editButton.isHidden = true
        plantLabel.textAlignment = .center
        plantLabel.font = UIFont(name: "NewYorkMedium-Regular", size: 16)
        plantLabel.textColor = lightGrey
        plantLabel.text = randomItem()
//        if (plantCounter < 21) {
//            plantLabel.text = plantArray[plantCounter].text
//            plantCounter += 1
//        } else {
//            plantCounter = 0
//        }
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
    
    @objc func addButtonFunc(_ sender: UIButton) {
        if numThoughts < 10 {
        isUpdate = "no"
            performSegue(withIdentifier: "Edit Thought", sender: self)
        }
        else {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.warning)
            performSegue(withIdentifier: "WarningVC", sender: self)
        }

    }
    
    @IBAction func editButton(_ sender: Any) {
        isUpdate = "yes"
        performSegue(withIdentifier: "Edit Thought", sender: self)
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        evaluation = DatabaseHelper.istance.searchByText(text: thoughtView.text)
        DatabaseHelper.istance.deleteThoughts(textThought: thoughtView.text)
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        numThoughts -= 1
        deleteButton.isHidden = true
        deleteButton.isEnabled = false
        editButton.isEnabled = false
        editButton.isHidden = true
        thoughtView.isHidden = true
        performSegue(withIdentifier: "feedback", sender: self)
    }
    
    func randomItem() -> String
    {
      if indexes.count == 0
      {
        print("Filling indexes array")
        indexes = Array(0..<numQuotes)
      }
        let randomIndex = Int(arc4random_uniform(UInt32(indexes.count)))
        let anIndex = indexes.remove(at: randomIndex)
        return plantArray[anIndex].text;
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Edit Thought") {
            if(isUpdate == "yes"){
            (segue.destination as!
                EditThoughtViewController).editedUserThought = thoughtView.text
                (segue.destination as!
                    EditThoughtViewController).isUpdate = isUpdate
            } else{
                (segue.destination as!
                EditThoughtViewController).editedUserThought = ""
                (segue.destination as!
                EditThoughtViewController).isUpdate = isUpdate
            }
        }else if(segue.identifier == "feedback"){
            (segue.destination as! WellDoneViewController).evaluation = evaluation
        }
    }
}
