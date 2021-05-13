//
//  ViewController.swift
//  Games
//
//  Created by period4 on 4/5/21.
//  Copyright © 2021 period4. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    @IBOutlet weak var labelFive: UILabel!
    @IBOutlet weak var labelSix: UILabel!
    @IBOutlet weak var labelSeven: UILabel!
    @IBOutlet weak var labelEight: UILabel!
    @IBOutlet weak var labelNine: UILabel!
    
    @IBOutlet weak var turnLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            turnLabel.text = "x"
    }
    func checkForWinner()
    {
        if labelOne.text == labelTwo.text && labelTwo.text == labelThree.text && labelOne.text != ""
        {
        if labelFour.text == labelFive.text && labelFive.text == labelSix.text && labelFour.text != ""
        {
            if labelSeven.text == labelEight.text && labelEight.text == labelNine.text && labelSeven.text != ""
            
            {
            if labelOne.text == labelFour.text && labelFour.text == labelSeven.text && labelOne.text != ""
        {
            if labelTwo.text == labelFive.text && labelFive.text == labelEight.text && labelTwo.text != ""
            {
                if labelThree.text == labelSix.text && labelSix.text == labelNine.text && labelThree.text != ""
                {
                    if labelOne.text == labelFive.text && labelFive.text == labelNine.text && labelOne.text != ""
                    {
                        if labelThree.text == labelFive.text && labelFive.text == labelSeven.text && labelThree.text != ""
                        {
}
        }
    }
    }
    }
    }
    }
    }
    }
   

}
    




