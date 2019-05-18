//
//  PlayAreaViewController.swift
//  NanoChallenge1Project
//
//  Created by Rizky Adipratama Ruddyar on 18/05/19.
//  Copyright © 2019 Rizky Adipratama Ruddyar. All rights reserved.
//

import UIKit

class PlayAreaViewController: UIViewController {
    
    @IBOutlet weak var correctButton1: UIButton!
    @IBOutlet weak var wrongButton1: UIButton!
    @IBOutlet weak var statusButton: UILabel!
    
    
    @IBAction func correctButtonClicked(_ sender: Any) {
    }
    
    @IBAction func wrongButtonClicked(_ sender: Any) {
    }
    
    var allButtons = [UIButton]()
    var status: String = ""
    
    enum gameState
    {
        case finished
        case playing
    }
    
    var state = gameState.finished
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        statusButton.isHidden = true
        
        allButtons = [correctButton1,wrongButton1]
        

    }
    
    
    
    var timer: Timer?
    var currentButton: UIButton!
    
    

    
    
    
  func displayRandomButton()
  {
    for myButton in allButtons {
        myButton.isHidden = true
    }
    let buttonIndex = Int.random(in: 0..<allButtons.count)
    currentButton = allButtons[buttonIndex]
    currentButton.center = CGPoint(x: <#T##CGFloat#>, y: <#T##CGFloat#>)
    currentButton.isHidden = false
    }
    
    
//   func reloadGameState()
//   {
//
//    for myButton in allButtons {
//        statusButton.isHidden = true
//    }
//    statusButton.alpha = 0.15
//    currentButton = correctButton1
//    state = gameState.finished
//
//    }
    
    
    func randCGFloat(_ min: CGFloat, _ max: CGFloat) -> CGFloat
    {
        return CGFloat.random(in: min..<max)
    }
    
    func randomXCoordinate() -> CGFloat
    {
        let left = view.safeAreaInsets.left + currentButton.bounds.width
        let right = view.bounds.width  - view.safeAreaInsets.right - currentButton.bounds.width
        return randCGFloat(left, right)
    }
    
    func  randomYCoordinate() -> CGFloat {
        let top = view.safeAreaInsets.top + currentButton.bounds.height
        let bottom = view.bounds.height - view.safeAreaInsets.bottom - view.bounds.height
        return randCGFloat(top, bottom)
    }
    
    func updateStatus(_ newLabel: String)
    {
        statusButton.text = "\(newLabel)"
    }
    
    
    
    
    
    
    func gameRunning ()
    {
        updateStatus(status)
        displayRandomButton()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false)
        {
            _ in if self.state == gameState.playing
            {
                if self.currentButton == self.correctButton1
                {
                    self.gameRunning()
                }
                else
                {
                    self.gameRunning()
                }
            }
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
