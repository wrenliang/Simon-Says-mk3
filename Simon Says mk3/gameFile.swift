//
//  gameFile.swift
//  Simon Says mk3
//
//  Created by Wren Liang on 2018-12-20.
//  Copyright © 2018 Wren Liang. All rights reserved.
//

import UIKit


//this class in essence stores the game; all the game logic resides in this class
class simonGame{
    var sequenceArray = Array(repeating: 0, count: 100)
    var currentLevel: Int = 0
    var currentPress: Int = 0
    var highScore: Int = 0
    var playerTurn: Bool = false
    
    var delegate: animatorDelegate?
    
    init(){
        print("initializing an instance of simonGame") //for debugging purposes
    }
    
    
    
    /*
     Method: startNewGame
     Parameter: none
     Purpose: gives sequenceArray 100 random numbers from 0 to 3, representing colors, as well as resetting
     currentLevel and currentPress
     Return values: none
     */
    func startNewGame(){
        currentLevel = 0
        currentPress = 0
        
        for index in 0...99{
            sequenceArray[index] = Int.random(in: 0...3)
            print("\(sequenceArray[index])") //for debugging
        }
        
        delegate?.showSequence(self)
        
    }
    
    
    
    /*
     Method: evaluatePress
     Parameter: takes the identity (number) of the button pressed
     Purpose: evaluates the user's press to see if it was correct
     Return values: none
    */
    func evaluatePress(buttonNumber: Int){
        
        
        //this branch is executed when the button pressed is correct
        if buttonNumber == sequenceArray[currentPress]{
            currentPress += 1 //this is executed before because the next branch needs to know if there are any more presses in the current level
            
            if currentPress <= currentLevel {
                //do nothing, and allow player to continue pressing sequence
                print("Continue to next press") //for debugging
            }
            
            //new level
            else {
                currentPress = 0
                currentLevel += 1
                
                //tells delegate to perform the following tasks
                delegate?.playerProgressed(self)
                delegate?.updateScoreboard(self)
                delegate?.showSequence(self)
                
            }
            
            
        }
        
            
        //player has pressed wrong button, and has lost
        else{
            delegate?.playerLost(self)
            delegate?.updateScoreboard(self)
            
        }
        
    }
    
    
    
    
    
    
    
}


