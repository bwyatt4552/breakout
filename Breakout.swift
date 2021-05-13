//
//  Breakout.swift
//  Games
//
//  Created by period4 on 4/27/21.
//  Copyright © 2021 period4. All rights reserved.
//

import UIKit
import AVFoundation
class Breakout: UIViewController,UICollisionBehaviorDelegate {
    @IBOutlet weak var paddle: UIView!
    
    @IBOutlet weak var ball: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var brickOne: UIView!
    @IBOutlet weak var brickTwo: UIView!
    @IBOutlet weak var brickThree: UIView!
    @IBOutlet weak var brickFour: UIView!
    @IBOutlet weak var brickFive: UIView!
    @IBOutlet weak var brickSix: UIView!
    @IBOutlet weak var brickSeven: UIView!
    @IBOutlet weak var brickEight: UIView!
    @IBOutlet weak var brickNine: UIView!
    @IBOutlet weak var brickTen: UIView!
    @IBOutlet weak var brickEleven: UIView!
    @IBOutlet weak var brickTwelve: UIView!
    @IBOutlet weak var brickThirteen: UIView!
    @IBOutlet weak var brickFourteen: UIView!
    @IBOutlet weak var brickFifteen: UIView!
    @IBOutlet weak var brickSixteen: UIView!
    @IBOutlet weak var brickSeventeen: UIView!
    @IBOutlet weak var brickEighteen: UIView!
    @IBOutlet weak var brickNineteen: UIView!
    @IBOutlet weak var brickTwenty: UIView!
    @IBOutlet weak var brickTwentyOne: UIView!
    @IBOutlet weak var brickTwentyTwo: UIView!
    @IBOutlet weak var brickTwentyThree: UIView!
    @IBOutlet weak var brickTwentyFour: UIView!
    @IBOutlet weak var brickTwentyFive: UIView!
    @IBOutlet weak var brickTwentySix: UIView!
    @IBOutlet weak var brickTwentySeven: UIView!
    @IBOutlet weak var brickTwentyEight: UIView!
    @IBOutlet weak var brickTwentyNine: UIView!
    @IBOutlet weak var brickThirty: UIView!
    
    var dynamicAnimator : UIDynamicAnimator!
    var pushBehavior : UIPushBehavior!
    var collisionBehavior : UICollisionBehavior!
    var allbricks = [UIView]()
    var ballDynamicBehavior : UIDynamicItemBehavior!
    var paddleDynamicBehavior : UIDynamicItemBehavior!
    var brickDynamicBehavior : UIDynamicItemBehavior!
    
    var brickCount = 30
    override func viewDidLoad() {
            super.viewDidLoad()

        allbricks = [brickOne , brickTwo , brickThree , brickFour , brickFive , brickSix , brickSeven , brickEight , brickNine , brickTen , brickEleven , brickTwelve , brickThirteen , brickFourteen , brickFifteen , brickSixteen , brickSeventeen, brickEighteen, brickNineteen, brickTwenty, brickTwentyOne, brickTwentyTwo, brickTwentyThree, brickTwentyFour, brickTwentyFive, brickTwentySix, brickTwentySeven, brickTwentyEight, brickTwentyNine, brickThirty]
        
        ball.layer.cornerRadius = 15
        dynamicBehavior()
        
        ball.isHidden = true
    
        // Do any additional setup after loading the view.
    }
    
    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
        paddle.center = CGPoint(x: sender.location(in: view).x, y: paddle.center.y)
        dynamicAnimator.updateItem(usingCurrentState: paddle)
    }
    func dynamicBehavior() {
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        pushBehavior = UIPushBehavior(items: [ball], mode: .instantaneous)
        pushBehavior.pushDirection = CGVector.init(dx: 0.7, dy: 0.7)
        pushBehavior.active = true
        pushBehavior.magnitude = 0.5
        dynamicAnimator.addBehavior(pushBehavior)
        
        collisionBehavior = UICollisionBehavior(items: [ball, paddle] + allbricks)
        collisionBehavior.collisionMode = .everything
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(collisionBehavior)
        collisionBehavior.collisionDelegate = self
        
        ballDynamicBehavior = UIDynamicItemBehavior(items: [ball] )
        ballDynamicBehavior.allowsRotation = false
        ballDynamicBehavior.elasticity = 1
        ballDynamicBehavior.friction = 0
        ballDynamicBehavior.resistance = 0
        dynamicAnimator.addBehavior(ballDynamicBehavior)
        
        paddleDynamicBehavior = UIDynamicItemBehavior(items: [paddle])
        paddleDynamicBehavior.friction = 0
        paddleDynamicBehavior.density = 10000000000
        paddleDynamicBehavior.elasticity = 0.7
        paddleDynamicBehavior.allowsRotation = false
        dynamicAnimator.addBehavior(paddleDynamicBehavior)
        
        brickDynamicBehavior = UIDynamicItemBehavior(items: allbricks)
        brickDynamicBehavior.allowsRotation = false
        brickDynamicBehavior.resistance = 0
        brickDynamicBehavior.density = 1000
        brickDynamicBehavior.elasticity = 0.7
        dynamicAnimator.addBehavior(brickDynamicBehavior)

    }
    @IBAction func startButton(_ sender: UIButton) {
        dynamicBehavior()
        sender.isHidden = true
        ball.isHidden = false
        paddle.isHidden = false
        print("test")
        let sound = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: "Try not to lose you know you will because you are trash at this and will never win you probabably already lost you are trash you are the trubisky of breakout go play tic tac toe")
        sound.speak(utterance)
        brickCount = 30
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item1: UIDynamicItem, with item2: UIDynamicItem, at p: CGPoint) {
        for brick in allbricks {
            if item1.isEqual(ball) && item2.isEqual(brick){
                brick.isHidden = true
                collisionBehavior.removeItem(brick)
                brickCount = brickCount-1
                print(brickCount)
                if brickCount == 0 {
                    alertTwo()
                    collisionBehavior.removeItem(ball)
                    startButton.isHidden = false
                    for brick in allbricks{ brick.isHidden = false
                        ballDynamicBehavior.resistance = 10000
                    }
                }
            }
        }
       
    }
    func reset() {
    
    }
    
    func alert() {
    
        let losingAlert = UIAlertController(title: "You Lost", message: "Play Again?", preferredStyle: .alert)
        
        let newGameButton = UIAlertAction(title: "New Game", style: .default){
            (action)
        in self.reset()
        }
        losingAlert.addAction(newGameButton)
       

    }
    
    func alertTwo() {
        let winningAlert = UIAlertController(title: "WINNER", message: "GOOD JOB", preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "EXIT", style:.cancel){
        (action)
        in self.reset()
        }
        winningAlert.addAction(cancelButton)
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        if p.y > paddle.center.y {
            alert()
        }
    }

   

    
    
   
        
        
}
    
    






