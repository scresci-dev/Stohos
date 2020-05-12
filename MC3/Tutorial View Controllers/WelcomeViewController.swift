//
//  ViewController.swift
//  MC3
//
//  Created by Gianna Stylianou on 17/2/20.
//  Copyright © 2020 Gianna Stylianou. All rights reserved.
//

import UIKit
class WelcomeViewController: UIViewController, UIScrollViewDelegate {

    
    var slides:[Slide] = [];
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var buttonView: UIButton!
    @IBOutlet weak var launchscreenImg: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var startJourney: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{ scrollView.delegate = self }
    }
    

    var counter: Int = 0
    var timerSpEss = Timer()
    var timerSpNot = Timer()
    var timerLaunch = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        var i = 0
        scrollView.isHidden = true
        pageControl.isHidden = true
        timerLaunch = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                    i += 1
                    if(i<=80){
                        self.launchscreenImg.image = UIImage(named: "launchscreen\(i)")
                    }
                    else{
                        if UserDefaults.standard.bool(forKey: "LaunchedBefore") {
                            self.performSegue(withIdentifier: "notFirst", sender: self)
                        }
                            
                        else{
                           self.launchscreenImg.removeFromSuperview()
                           self.pageControl.isHidden = false
                        self.scrollView.isHidden = false
                        }
                        self.timerLaunch.invalidate()
                    }
                }
        
       let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeLeft.direction = .left
        scrollView.addGestureRecognizer(swipeLeft)

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .right
        scrollView.addGestureRecognizer(swipeRight)
        
        UserDefaults.standard.set(true, forKey: "Audio")
        overrideUserInterfaceStyle = .light
//        let gestureRec = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
//        view.addGestureRecognizer(gestureRec)
//        showMessages()
    }
    
    func createSlides() -> [Slide]{
            
            //Slide Federica Pellegrini
            let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            var j = 1
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if(j >= 210){
                 j = 1
             }
                slide1.blobl.setImage(UIImage(named: "Rosa\(j)"), for: .normal);
                j += 1
                }
            
            slide1.descr.image = UIImage(named: "EssentialWelcomeXR")
            slide1.startYourJourney.isHidden = true
            slide1.startButton.isHidden = true
           
            //Tap to go on page of Federica Pellegrini
//            let singleTapPellegrini = UITapGestureRecognizer(target: self, action: #selector(tapDetectedF))
//            slide1.isUserInteractionEnabled = true
//            slide1.addGestureRecognizer(singleTapPellegrini)
            
            //Slide Williams sister
            let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        var i = 1
          Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if(i >= 210){
                 i = 1
             }
                slide2.blobl.setImage(UIImage(named: "Verde\(i)"), for: .normal);
                i += 1
                }
            slide2.descr.image = UIImage(named: "NonEssentialWelcomeXR")
            slide2.startYourJourney.isHidden = true
            slide2.startButton.isHidden = true
            
           let startTapped = UITapGestureRecognizer(target: self, action: #selector(startPressed))
        
            //Slide incomplete
            let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            slide3.blobl.isHidden = true
            slide3.descr.isHidden = true
            slide3.startYourJourney.isHidden = false
            slide3.startButton.isHidden = false
            slide3.startButton.addGestureRecognizer(startTapped)
        
            return [slide1, slide2, slide3]
    }
    
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        let scrollSize = CGSize(width: view.frame.width * CGFloat(3),height: 600)
        scrollView.contentSize = scrollSize
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
            
            let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
            let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x

            let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
            let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
            
            let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
            let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
            
            let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)

            
            if (percentOffset.x <= 0.25 ){
                pageControl.currentPage = 0
                
            } else if (percentOffset.x > 0.25 && percentOffset.x <= 0.50){
                pageControl.currentPage = 1
                
            } else if(percentOffset.x > 0.50 && percentOffset.x <= 1){
                 pageControl.currentPage = 2
            }
        }

    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer)
    {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer
        {
            switch swipeGesture.direction
            {
            case UISwipeGestureRecognizer.Direction.right:
                     //write your logic for right swipe
                      if(counter != 0 && counter !=  1){
                      counter -= 1
                        pageControl.currentPage = counter
//                      showMessages()
                      }
            case UISwipeGestureRecognizer.Direction.left:
                     //write your logic for left swipe
                      if(counter != 0 && counter != 3){
                      counter += 1
                        print(counter)
                        pageControl.currentPage = counter

//                      showMessages()
                      }
                default:
                    break
            }
        }
    }
    
    func showMessages() {
        if (counter > 3 ) {
            performSegue(withIdentifier: "TutorialQuestion", sender: self)
        }
        else {
            imageView.image = UIImage(named: "\(messageArray[counter].imageName)")
            if (counter == 1) {
                if(view.frame.width > 375){
                                  imageView.image = UIImage(named: "EssentialWelcomeXR")

                              } else{
                              }
                start.isHidden = true
                imageView.isHidden = false
                startJourney.isHidden = true
                self.pageControl.isHidden = false
                pageControl.currentPage = 0
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
                if(view.frame.width > 375){
                    imageView.image = UIImage(named: "NonEssentialWelcomeXR")

                } else{
                }
                start.isHidden = true
                imageView.isHidden = false
                startJourney.isHidden = true
                pageControl.currentPage = 1
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
                    start.isHidden = true
                    self.pageControl.isHidden = true
                    startJourney.isHidden = true
                    self.imageView.isHidden = true
                    self.launchscreenImg.isHidden = false
                    var i = 0
                    buttonView.isHidden = true
                   timerLaunch = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                        i += 1
                        if(i<=80){
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
                    imageView.isHidden = true
                    startJourney.isHidden = false
                    start.isHidden = false
                    pageControl.currentPage = 2
                buttonView.isHidden = true
                }
            }
        }
    }

    @objc func startPressed() {
         performSegue(withIdentifier: "TutorialQuestion", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
              if (segue.identifier == "notFirst") {
                 
                  (segue.destination as!
                   UserThoughtsViewController).n = 1
                  
          }
       }
}
