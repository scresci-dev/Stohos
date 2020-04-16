//
//  ViewController.swift
//  MC3
//
//  Created by Gianna Stylianou on 17/2/20.
//  Copyright © 2020 Gianna Stylianou. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var buttonView: UIButton!
    @IBOutlet weak var launchscreenImg: UIImageView!
    
    var counter: Int = 0
    var timerSpEss = Timer()
    var timerSpNot = Timer()
    var timerLaunch = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(true, forKey: "Audio")
        overrideUserInterfaceStyle = .light
        let gestureRec = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
        view.addGestureRecognizer(gestureRec)
        showMessages()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @objc func someAction(_ sender:UITapGestureRecognizer) {
        if(counter != 0){
        counter += 1
        showMessages()
        }
    }
    
    func showMessages() {
        if (counter > 3 ) {
            performSegue(withIdentifier: "TutorialQuestion", sender: self)
        }
        else {
            imageView.image = UIImage(named: "\(messageArray[counter].imageName)")
            if (counter == 1) {
                self.imageView.isHidden = false
                self.launchscreenImg.isHidden = true
                buttonView.isHidden = false
                var j = 1
                timerSpNot.invalidate()
                timerSpEss.invalidate()
                timerSpEss = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                   if(j >= 210){
                        j = 1
                    }
                    self.buttonView.setBackgroundImage(UIImage(named: "Rosa\(j)"), for: .normal)
                        j += 1
                           }
            }
            else if (counter == 2) {
                buttonView.isHidden = false
                var j = 1
                timerSpEss.invalidate()
                timerSpNot.invalidate()
                timerSpNot =  Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                     if(j >= 210){
                          j = 1
                      }
                      self.buttonView.setBackgroundImage(UIImage(named: "Verde\(j)"), for: .normal)
                          j += 1
                }
            }
            else {
                if(counter == 0){
                    self.imageView.isHidden = true
                    self.launchscreenImg.isHidden = false
                    var i = 0
                    buttonView.isHidden = true
                   timerLaunch = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                        i += 1
                        if(i<=100){
                            print(i)
                            self.launchscreenImg.image = UIImage(named: "launchscreen\(i)")
                        }
                        else{
                            if UserDefaults.standard.bool(forKey: "LaunchedBefore") {
                                self.performSegue(withIdentifier: "notFirst", sender: self)
                            }
                                
                            else{
                                self.counter += 1
                                self.showMessages()
                            }
                            self.timerLaunch.invalidate()
                        }
                        
                        
                    }
                }else{
                buttonView.isHidden = true
                }
            }
        }
    }
}
