//
//  Player.swift
//  Jack The Giant
//
//  Created by Matthew Bortolin on 10/6/17.
//  Copyright © 2017 Matthew Bortolin. All rights reserved.
//

import SpriteKit

class Player: SKSpriteNode {
    
    private var textureAtlas = SKTextureAtlas()
    private var playerAnimation = [SKTexture]()
    private var animatePlayerAction = SKAction()
    
    // Initialise Player Animations
    func initializePlayerAndAnimations() {
        
        textureAtlas = SKTextureAtlas(named: "Player.atlas")
        
        for i in 2...textureAtlas.textureNames.count {
            let name = "Player \(i)"
            playerAnimation.append(SKTexture(imageNamed: name))
        }
        animatePlayerAction = SKAction.animate(with: playerAnimation, timePerFrame: 0.08, resize: true, restore: false)
        }
    
    // Start Player animation
    func animatePlayer() {
        self.run(SKAction.repeatForever(animatePlayerAction),withKey: "Animate")
    }
    
    // Stop Player animation
    func stopPlayerAnimation() {
        self.removeAction(forKey: "Animate")
    }
    
    // Move player
    func movePlayer(moveLeft: Bool) {
        
        if moveLeft {
            self.position.x = self.position.x - 7
        } else {
            self.position.x = self.position.x + 7
        }
    }
}




