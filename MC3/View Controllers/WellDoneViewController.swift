//
//  WellDoneViewController.swift
//  MC3
//
//  Created by Gianna Stylianou on 4/3/20.
//  Copyright © 2020 Gianna Stylianou. All rights reserved.
//

import Foundation
import UIKit

class WellDoneViewController: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    var i = 1;
    var timer = Timer()
    var evaluation = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(evaluation == "essential"){
            timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                
                if( self.i >= 46){
                self.img.image = UIImage(named: "rosawelldone45")

                } else{
                    self.img.image = UIImage(named: "rosawelldone\(self.i)")
                            self.i += 1
                }
            }
        } else{
            timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                
                if( self.i >= 46){
                self.img.image = UIImage(named: "verdewelldone45")

                } else{
                    self.img.image = UIImage(named: "verdewelldone\(self.i)")
                            self.i += 1
                }
            }
        }
        

        let gestureRec = UITapGestureRecognizer(target: self, action:  #selector (self.closePopUp(_:)))
        view.addGestureRecognizer(gestureRec)
    }
    
    
    @objc func closePopUp(_ sender:UITapGestureRecognizer) {
        performSegue(withIdentifier: "GoBack", sender: self)
    }
}
