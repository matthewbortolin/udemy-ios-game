//
//  GameplayScene.swift
//  Jack The Giant
//
//  Created by Matthew Bortolin on 10/6/17.
//  Copyright © 2017 Matthew Bortolin. All rights reserved.
//  Awesome Tutes - udemy.com
//

import SpriteKit

class GameplayScene: SKScene, SKPhysicsContactDelegate {
    
    var cloudsController = CloudsController()
    
    var mainCamera: SKCameraNode?
    
    var bg1: BGClass?
    var bg2: BGClass?
    var bg3: BGClass?
    
    var player: Player?
    
    var canMove = false
    var moveLeft = false
    
    var center: CGFloat?
    
    private var cameraDistanceBeforeCreatingNewClouds = CGFloat()
    
    let distanceBetweenClouds = CGFloat(240)
    let minX = CGFloat(-150)
    let maxX = CGFloat(150)
    
    private var pausePanel: SKSpriteNode?
    
    override func didMove(to: SKView) {
        initializeVariables()
    }
    
    override func update(_ currentTime: TimeInterval) {
        moveCamera()
        managePlayer()
        manageBackgrounds()
        createNewClouds()
        player?.setScore()
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        var firstBody = SKPhysicsBody()
        var secondBody = SKPhysicsBody()
        
        if contact.bodyA.node?.name == "Player" {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
            
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if firstBody.node?.name == "Player" && secondBody.node?.name == "Life" {
            
            // Play the sound for the life
            
            // Increment the life
            GamePlayController.instance.incrementLives()
            
            // Remove from the screen
            secondBody.node?.removeFromParent()
            
        } else if firstBody.node?.name == "Player" && secondBody.node?.name == "Coin" {
            
            // Play the sound for the coin
            // Increment the coins
            GamePlayController.instance.incrementCoins()
            
            // Remove from the screen
            secondBody.node?.removeFromParent()
            
        } else if firstBody.node?.name == "Player" && secondBody.node?.name == "Dark Cloud" {
            
            // Kill the player
        }

    }
    
    // When touch to screen has started
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if self.scene?.isPaused == false {
                if location.x > center! {
                    moveLeft = false
                    player?.animatePlayer(moveLeft: moveLeft)
                } else {
                    moveLeft = true
                    player?.animatePlayer(moveLeft: moveLeft)
                }
            }
            
            // If Pause button is touched
            if nodes(at: location)[0].name == "Pause" {
                self.scene?.isPaused = true
                createPausePanel()
            }
            
            // If Resume button is touched resume game
            if nodes(at: location)[0].name == "Resume" {
                pausePanel?.removeFromParent()
                self.scene?.isPaused = false
            }
            
            // If Quit button is touched reload main menu
            if nodes(at: location)[0].name == "Quit" {
                let scene = MainMenuScene(fileNamed: "MainMenu")
                scene!.scaleMode = .aspectFill
                
                self.view?.presentScene(scene!, transition: SKTransition.doorsCloseVertical(withDuration: 1))
            }
        }
        
        canMove = true
    }
    
    // When touch to the screen has finished
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        canMove = false
        player?.stopPlayerAnimation()
    }
    
    func getBackgrounds() {
        bg1 = self.childNode(withName: "BG 1") as? BGClass!
        bg2 = self.childNode(withName: "BG 2") as? BGClass!
        bg3 = self.childNode(withName: "BG 3") as? BGClass!
    }
    
    func initializeVariables() {
        
        physicsWorld.contactDelegate = self
        
        center = (self.scene?.size.width)! / (self.scene?.size.height)!
        
        player = self.childNode(withName: "Player") as? Player!
        player?.initializePlayerAndAnimations()

        mainCamera = (self.childNode(withName: "Main Camera") as? SKCameraNode!)!
        
        getBackgrounds()
        
        getLabels()
        
        // initialise score, coins, lives
        GamePlayController.instance.initialiseVariables()
        
        cloudsController.arrangeCloudsInScene(scene: self.scene!, distanceBetweenClouds: distanceBetweenClouds, center: center!, minX: minX, maxX: maxX, initialClouds: true)
    
        cameraDistanceBeforeCreatingNewClouds = (mainCamera?.position.y)! - 400
    }
    
    func managePlayer() {
        if canMove {
            player?.movePlayer(moveLeft: moveLeft)
        }
    }
    
    func moveCamera() {
        self.mainCamera?.position.y -= 3
    }
    
    func manageBackgrounds() {
        bg1?.moveBG(camera: mainCamera!)
        bg2?.moveBG(camera: mainCamera!)
        bg3?.moveBG(camera: mainCamera!)
    }
    
    // Adds clouds continously after initial clouds
    func createNewClouds() {
        
        if cameraDistanceBeforeCreatingNewClouds > (mainCamera?.position.y)! {
            cameraDistanceBeforeCreatingNewClouds = (mainCamera?.position.y)! - 400
            
            cloudsController.arrangeCloudsInScene(scene: self, distanceBetweenClouds: distanceBetweenClouds, center: center!, minX: minX, maxX: maxX, initialClouds: false)
        }
    }
    
    // Assign Score, Lives, Coins to singleton instance of GamePlayController
    func getLabels() {
        GamePlayController.instance.scoreText = self.mainCamera!.childNode(withName: "Score") as? SKLabelNode!
        GamePlayController.instance.coinText = self.mainCamera!.childNode(withName: "Coin Score") as? SKLabelNode!
        GamePlayController.instance.lifeText = self.mainCamera!.childNode(withName: "Lives") as? SKLabelNode!
    }
    
    // Pauses game and displays pause panel
    func createPausePanel() {
        
        pausePanel = SKSpriteNode(imageNamed: "Pause Menu")
        
        let resumeBtn = SKSpriteNode(imageNamed: "Resume Button")
        let quitBtn = SKSpriteNode(imageNamed: "Quit Button 2")
        
        pausePanel?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        pausePanel?.xScale = 1.6
        pausePanel?.yScale = 1.6
        pausePanel?.zPosition = 5
        
        pausePanel?.position = CGPoint(x: (self.mainCamera?.frame.size.width)! / 2, y: (self.mainCamera?.frame.size.height)! / 2)
        
        // Add positioning to resume button
        resumeBtn.name = "Resume"
        resumeBtn.zPosition = 6
        resumeBtn.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        resumeBtn.position = CGPoint(x: (pausePanel?.position.x)!, y: (pausePanel?.position.y)! + 25)
        
        // Add positioning to the quit button
        quitBtn.name = "Quit"
        quitBtn.zPosition = 6
        quitBtn.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        quitBtn.position = CGPoint(x: (pausePanel?.position.x)!, y: (pausePanel?.position.y)! - 45)
        
        // Add buttons to the pause panel
        pausePanel?.addChild(resumeBtn)
        pausePanel?.addChild(quitBtn)
        
        // Add pause panel to main camera
        self.mainCamera?.addChild(pausePanel!)
    }
}









