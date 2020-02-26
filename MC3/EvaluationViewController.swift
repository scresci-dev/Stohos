//
//  TutorialEvaluationViewController.swift
//  MC3
//
//  Created by Gianna Stylianou on 20/2/20.
//  Copyright © 2020 Gianna Stylianou. All rights reserved.
//

import Foundation
import UIKit

class EvaluationViewController: UIViewController {
   
    @IBOutlet weak var textAnswer: UITextView!
    @IBOutlet weak var essentialView: UIImageView!
    @IBOutlet weak var notEssentialView: UIImageView!
    
    var userAnswer: String!
    var count: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pan = UIPanGestureRecognizer(target: self, action: #selector(important))
        essentialView.addGestureRecognizer(pan)
    }
    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = touches.first!
//        let location = touch.location(in: view)
//
//        let notessentialy = notEssentialView.center.x
//        if essentialView.frame.contains(location){
//            essentialView.transform = CGAffineTransform(translationX: 0, y: location.y)
//        }
//        if notEssentialView.frame.contains(location) {
//            notEssentialView.center = CGPoint(x: notessentialy, y: location.y)
//        }
//    }
//
    
    @objc func important(sender: UIPanGestureRecognizer){
           let transformation = sender.translation(in: view)
           if sender.state == .began {
               print("began")
           }
           else if sender.state == .changed {
            essentialView.transform = CGAffineTransform(translationX: 0, y: transformation.y)
           }
           else if sender.state == .ended {
            if transformation.y <= 100
            {
                UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations: {
                    self.essentialView.transform = .identity
                })

            }
            else {
                UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations: {
                    self.essentialView.transform = CGAffineTransform(translationX: 0, y: -200)
                    self.textAnswer.transform = CGAffineTransform(translationX: 0, y: -200)
                }, completion: {
                    _ in
                    print("ended")

                }
                )
            }
        }
    }
       
}

extension EvaluationViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(
      _ gestureRecognizer: UIGestureRecognizer,
      shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer
    ) -> Bool {
      return true
    }
}

