//
//  ViewController.swift
//  TicTacToe
//
//  Created by Tyler McGee on 5/25/17.
//  Copyright © 2017 Tyler McGee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBOutlet weak var playAgainLabel: UIButton!
    
    @IBAction func playAgainButton(_ sender: Any) {
        
        activeGame = true
        
        activePlayer = 1
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        var button: UIButton
        
        for i in 1 ..<10 {
            
            if let button = view.viewWithTag(i) as? UIButton {
                
                button.setImage(nil, for: [])
                
            }
            
        }
        
                winnerLabel.isHidden = true
            
                playAgainLabel.isHidden = true
                
                winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
                
                playAgainLabel.center = CGPoint(x: playAgainLabel.center.x - 5, y: playAgainLabel.center.y)
            
            }
        }
    
    
    // 1 is noughts, 2 is crosses
    
    var activeGame = true
    
    var activePlayer = 1
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] // 0 means empty, 1 means noughts, 2 means crosses
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    @IBAction func buttonPressed(_ sender: Any) {
        
        let activePosition = (sender as AnyObject).tag - 1
        
        if gameState[activePosition] == 0 && activeGame{
            
            gameState[activePosition] = activePlayer
        
            if activePlayer == 1 {
        
                (sender as AnyObject).setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 2

           
            } else {
            
                (sender as AnyObject).setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
            }
            
            for combination in winningCombinations {
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    // we have a winner
                    
                    activeGame = false
                    
                    winnerLabel.isHidden = false
                    playAgainLabel.isHidden = false
                    
                    if gameState[combination[0]] == 1 {
                        
                        winnerLabel.text = "Noughts has won!"
                    
                    } else {
                        
                        winnerLabel.text = "Crosses has won!"
                    
                    }
                    
                    UIView.animate(withDuration: 1, animations: {
                    
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        self.playAgainLabel.center = CGPoint(x: self.playAgainLabel.center.x + 500, y: self.playAgainLabel.center.y)
                    
                })
                }
            }
            
        }
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
        winnerLabel.isHidden = true
        playAgainLabel.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        
        playAgainLabel.center = CGPoint(x: playAgainLabel.center.x - 5, y: playAgainLabel.center.y)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

