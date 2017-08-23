//
//  GamePlayController.swift
//  Jack The Giant
//
//  Created by Matthew Bortolin on 16/1/17.
//  Copyright © 2017 Matthew Bortolin. All rights reserved.
//  Awesome Tuts - udemy.com
//

import SpriteKit

class GamePlayController {
    
    // Create a static instance and private so it cant be changed outside of class
    static let instance = GamePlayController()
    private init() {}
    
    // Assign score, lives and coins to SKLabels
    var scoreText: SKLabelNode?
    var coinText: SKLabelNode?
    var lifeText: SKLabelNode?
    
    var score: Int?
    var coins: Int?
    var lives: Int?
    
    // Function to initialise variables
    // If it is a new game or restarting after a player has died
    func initialiseVariables() {
        
        if GameManager.instance.gameStartedFromMainMenu {
            
            GameManager.instance.gameStartedFromMainMenu = false
            
            score = 0
            coins = 0
            lives = 2
            
            scoreText?.text = "\(String(describing: score!))"
            coinText?.text = "x\(String(describing: coins!))"
            lifeText?.text = "x\(String(describing: lives!))"
            
            
        } else if GameManager.instance.gameRestartedPlayerDied {
            
            GameManager.instance.gameRestartedPlayerDied = false
            
            scoreText?.text = "\(String(describing: score!))"
            coinText?.text = "x\(String(describing: coins!))"
            lifeText?.text = "x\(String(describing: lives!))"

        }
    }
    
    // Increment the score
    func incrementScore() {
        score! += 1
        scoreText?.text = "\(score!)"
    }
    
    // Increment the coins and score
    func incrementCoins() {
        coins! += 1
        score! += 200
        
        coinText?.text = "x\(coins!)"
        scoreText?.text = "\(score!)"
    }
    
    // Increment the lives and score
    func incrementLives() {
        
        lives! += 1
        score! += 300
        
        lifeText?.text = "x\(lives!)"
        scoreText?.text = "\(score!)"
    }
    
    
    
    
    
}
