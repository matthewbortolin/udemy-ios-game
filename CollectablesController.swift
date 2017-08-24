//
//  CollectablesController.swift
//  Jack The Giant
//
//  Created by Matthew Bortolin on 23/8/17.
//  Copyright © 2017 Matthew Bortolin. All rights reserved.
//

import SpriteKit

class CollectablesController {
    
    func getCollectable() -> SKSpriteNode {
        
        var collectable = SKSpriteNode()
        
        if Int(randomBetweenNumbers(firstNum: 0, secondNum: 7)) >= 4 {
            
            if GamePlayController.instance.lives! < 2 {
                
                // Spawn a life if lives are less than 2
                collectable = SKSpriteNode(imageNamed: "Life")
                collectable.name = "Life"
                collectable.physicsBody = SKPhysicsBody(rectangleOf: collectable.size)
            } else {
                collectable.name = "Empty"
            }
            
        } else {
            
            // Spawn a coin
            collectable = SKSpriteNode(imageNamed: "Coin")
            collectable.name = "Coin"
            collectable.physicsBody = SKPhysicsBody(circleOfRadius: collectable.size.height / 2)
        }
        
        collectable.physicsBody?.affectedByGravity = false
        collectable.physicsBody?.categoryBitMask = ColliderType.DarkCloudAndCollectibles
        collectable.physicsBody?.collisionBitMask = ColliderType.Player
        collectable.zPosition = 2
        
        return collectable
    }
    
    func randomBetweenNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }

}
