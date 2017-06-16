//
//  Player.swift
//  Jack The Giant
//
//  Created by Matthew Bortolin on 10/6/17.
//  Copyright © 2017 Matthew Bortolin. All rights reserved.
//

import SpriteKit

// For collision bodies
struct ColliderType {
    static let Player: UInt32 = 0
    static let Cloud: UInt32 = 1
    static let DarkCloudAndCollectibles: UInt32 = 2
}

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

        // Physics bodies for player
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width - 50, height: self.size.height - 5))
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.restitution = 0
        self.physicsBody?.categoryBitMask = ColliderType.Player
        self.physicsBody?.collisionBitMask = ColliderType.Cloud
        self.physicsBody?.contactTestBitMask = ColliderType.DarkCloudAndCollectibles
        
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




