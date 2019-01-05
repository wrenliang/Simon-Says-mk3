//
//  delegateProtocol.swift
//  Simon Says mk3
//
//  Created by Wren Liang on 2019-01-04.
//  Copyright © 2019 Wren Liang. All rights reserved.
//


import UIKit

/*this protocol is for the game file to communicate with the ViewController
so it can update UI for a variety of situations
*/
protocol animatorDelegate{
    
    func showSequence(_ sender: simonGame)
    func updateScoreboard(_ sender: simonGame)
    func playerLost(_ sender: simonGame)
    func playerProgressed(_ sender: simonGame)
    
}

