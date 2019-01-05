//
//  ViewController.swift
//  Simon Says mk3
//
//  Created by Wren Liang on 2019-01-04.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var redImage: UIImageView!
    @IBOutlet var blueImage: UIImageView!
    @IBOutlet var greenImage: UIImageView!
    @IBOutlet var yellowImage: UIImageView!
    
    var instanceOfGame = simonGame() //creates an instance of the simonGame class when UI is loaded
    var timeCount: Double = 0.0 //this variable is for the DispatchQueue to time animations; will be used later in animation method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func redButton(_ sender: UIButton) {
        
        //if statement to ensure player cannot input any presses while sequence is being displayed
        if instanceOfGame.playerTurn == true {
            print("redButton pressed") //for debugging
            instanceOfGame.evaluatePress(buttonNumber: 0);
        }
        
    }
    
    
    @IBAction func blueButton(_ sender: UIButton) {
        
        if instanceOfGame.playerTurn == true {
            print("redButton pressed") //for debugging
            instanceOfGame.evaluatePress(buttonNumber: 1);
        }
        
    }
    
    
    @IBAction func greenButton(_ sender: UIButton) {
        
        if instanceOfGame.playerTurn == true {
            print("redButton pressed") //for debugging
            instanceOfGame.evaluatePress(buttonNumber: 2);
        }
        
    }
    
    
    @IBAction func yellowButton(_ sender: UIButton) {
        
        if instanceOfGame.playerTurn == true {
            print("redButton pressed") //for debugging
            instanceOfGame.evaluatePress(buttonNumber: 3);
        }
        
    }
    
    

}

