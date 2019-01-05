//
//  ViewController.swift
//  Simon Says mk3
//
//  Created by Wren Liang on 2019-01-04.
//  Copyright © 2019 Wren Liang. All rights reserved.
//



//VIEWS CONFIGURED FOR IPHONE XR


import UIKit

class ViewController: UIViewController, animatorDelegate {
    
    @IBOutlet var redImage: UIImageView!
    @IBOutlet var blueImage: UIImageView!
    @IBOutlet var greenImage: UIImageView!
    @IBOutlet var yellowImage: UIImageView!

    @IBOutlet var currentScoreLabel: UILabel!
    @IBOutlet var highScoreLabel: UILabel!
    @IBOutlet var youLoseLabel: UILabel!
    @IBOutlet var yourTurnLabel: UIImageView!
    
    
    var instanceOfGame = simonGame() //creates an instance of the simonGame class when UI is loaded
    var timeCount: Double = 0.0 //this variable is for the DispatchQueue to time animations; will be used later in animation method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        instanceOfGame.delegate = self
    }

    
    
    
    @IBAction func newGameButton(_ sender: UIButton) {
        
        instanceOfGame.playerTurn = false
        instanceOfGame.startNewGame()
        self.youLoseLabel.isHidden = true

    
    }
    
    
    @IBAction func redButton(_ sender: UIButton) {
        
        //if statement to ensure player cannot input any presses while sequence is being displayed
        if instanceOfGame.playerTurn == true {
            print("redButton pressed") //for debugging
            instanceOfGame.evaluatePress(buttonNumber: 0);
        }
        
    }
    
    
    @IBAction func greenButton(_ sender: UIButton) {
        
        if instanceOfGame.playerTurn == true {
            print("greenButton pressed") //for debugging
            instanceOfGame.evaluatePress(buttonNumber: 1);
        }
        
    }
    
    
    @IBAction func blueButton(_ sender: UIButton) {
        
        if instanceOfGame.playerTurn == true {
            print("blueButton pressed") //for debugging
            instanceOfGame.evaluatePress(buttonNumber: 2);
        }
        
    }
    
    
    @IBAction func yellowButton(_ sender: UIButton) {
        
        if instanceOfGame.playerTurn == true {
            print("yellowButton pressed") //for debugging
            instanceOfGame.evaluatePress(buttonNumber: 3);
        }
        
    }
    
    

/*
delegate functions
*/
    
    
    func showSequence(_ sender: simonGame){
        
        timeCount = 1.0
        instanceOfGame.playerTurn = false
        
        for index in 0...(instanceOfGame.currentLevel){
            
            
            switch instanceOfGame.sequenceArray[index] {
                
            case 0:
                DispatchQueue.main.asyncAfter(deadline: .now() + timeCount){
                    print("red") //debugging
                    self.redImage.image = UIImage(named: "redFull")
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                        self.redImage.image = UIImage(named: "redHalf")
                    }
                }
                
                
                
            case 1:
                DispatchQueue.main.asyncAfter(deadline: .now() + timeCount){
                    print("green") //debugging
                    self.greenImage.image = UIImage(named: "greenFull")
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                        self.greenImage.image = UIImage(named: "greenHalf")
                    }
                }
            case 2:
                DispatchQueue.main.asyncAfter(deadline: .now() + timeCount){
                    print("blue") //debugging
                    self.blueImage.image = UIImage(named: "blueFull")
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                        self.blueImage.image = UIImage(named: "blueHalf")
                    }
                }
            case 3:
                DispatchQueue.main.asyncAfter(deadline: .now() + timeCount){
                    print("yellow")
                    self.yellowImage.image = UIImage(named: "yellowFull")
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                        self.yellowImage.image = UIImage(named: "yellowHalf")
                    }
                }
            default:
                print("Error: out of bounds")
                
            }
            
            timeCount += 2.0
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + timeCount){
            self.yourTurnLabel.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.75){
                self.yourTurnLabel.isHidden = true
                self.instanceOfGame.playerTurn = true
            }
            
        }
        
        
    }
    
    func updateScoreboard(_ sender: simonGame){
        currentScoreLabel.text = "Current Score: \(instanceOfGame.currentLevel)"
        
        if instanceOfGame.currentLevel > instanceOfGame.highScore{
            instanceOfGame.highScore = instanceOfGame.currentLevel
            highScoreLabel.text = "High Score: \(instanceOfGame.highScore)"
            
        }
    }
    
    func playerLost(_ sender: simonGame){
        self.view.backgroundColor = UIColor.red
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            self.view.backgroundColor = UIColor.white
            self.youLoseLabel.isHidden = false
        }
        
    }
    
    func playerProgressed(_ sender: simonGame){
        self.view.backgroundColor = UIColor(red:0.51, green:1.00, blue:0.52, alpha:1.0)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            self.view.backgroundColor = UIColor.white
        }
    }
    
    
    
    
    
    

}

