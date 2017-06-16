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
    func animatePlayer(moveLeft: Bool) {
        
        // Changes direction of player
        if moveLeft {
            self.xScale = -fabs(self.xScale)
        } else {
            self.xScale = fabs(self.xScale)
        }
        
        self.run(SKAction.repeatForever(animatePlayerAction),withKey: "Animate")
    }
    
    // Stop Player animation, return back to idle animation and resize
    func stopPlayerAnimation() {
        self.removeAction(forKey: "Animate")
        self.texture = SKTexture(imageNamed: "Player 1")
        self.size = (self.texture?.size())!
    }
    
    // Move player
    func movePlayer(moveLeft: Bool) {
        
        // if is true moves left otherwise moves right
        if moveLeft {
            self.position.x -= 7
        } else {
            self.position.x += 7
        }
    }
}




