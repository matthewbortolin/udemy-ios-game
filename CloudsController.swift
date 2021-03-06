//
//  CloudsController.swift
//  Jack The Giant
//
//  Created by Matthew Bortolin on 16/6/17.
//  Copyright © 2017 Matthew Bortolin. All rights reserved.
//  Awesomes Tuts - udemy.com
//

import SpriteKit

class CloudsController {
  
    let collectableController = CollectablesController()
    
    var lastCloudPositionY = CGFloat()
    
    // Randomise clouds
    private func shuffle(cloudsArray: [SKSpriteNode]) -> [SKSpriteNode] {
        
        var shuffledArray = cloudsArray;
        
        for i in 0..<shuffledArray.count {
            let j = Int(arc4random_uniform(UInt32(shuffledArray.count - i))) + i;
            if i == j {continue}
            swap(&shuffledArray[i], &shuffledArray[j]);
        }
        
        return shuffledArray;
    }
    
    func createClouds() -> [SKSpriteNode] {
        
        var clouds = [SKSpriteNode]()
        
        for _ in 0 ..< 2 {
            
            let cloud1 = SKSpriteNode(imageNamed: "Cloud 1")
            cloud1.name = "1"
            
            let cloud2 = SKSpriteNode(imageNamed: "Cloud 2")
            cloud2.name = "2"
            
            let cloud3 = SKSpriteNode(imageNamed: "Cloud 3")
            cloud3.name = "3"
            
            let darkCloud = SKSpriteNode(imageNamed: "Dark Cloud")
            darkCloud.name = "Dark Cloud"
            
            cloud1.xScale = 0.9
            cloud1.yScale = 0.9
            
            cloud2.xScale = 0.9
            cloud2.yScale = 0.9
            
            cloud3.xScale = 0.9
            cloud3.yScale = 0.9
            
            darkCloud.xScale = 0.9
            darkCloud.yScale = 0.9
            
            // Add physics body to the clouds
            cloud1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: cloud1.size.width - 10, height: cloud1.size.height - 10))
            cloud1.physicsBody?.affectedByGravity = false
            cloud1.physicsBody?.restitution = 0
            cloud1.physicsBody?.categoryBitMask = ColliderType.Cloud
            cloud1.physicsBody?.collisionBitMask = ColliderType.Player
            
            cloud2.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: cloud2.size.width - 10, height: cloud2.size.height - 10))
            cloud2.physicsBody?.affectedByGravity = false
            cloud2.physicsBody?.restitution = 0
            cloud2.physicsBody?.categoryBitMask = ColliderType.Cloud
            cloud2.physicsBody?.collisionBitMask = ColliderType.Player
            
            cloud3.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: cloud3.size.width - 10, height: cloud3.size.height - 10))
            cloud3.physicsBody?.affectedByGravity = false
            cloud3.physicsBody?.restitution = 0
            cloud3.physicsBody?.categoryBitMask = ColliderType.Cloud
            cloud3.physicsBody?.collisionBitMask = ColliderType.Player
            
            darkCloud.physicsBody = SKPhysicsBody(rectangleOf: darkCloud.size)
            darkCloud.physicsBody?.affectedByGravity = false
            darkCloud.physicsBody?.categoryBitMask = ColliderType.DarkCloudAndCollectibles
            darkCloud.physicsBody?.collisionBitMask = ColliderType.Player
            
            clouds.append(cloud1)
            clouds.append(cloud2)
            clouds.append(cloud3)
            clouds.append(darkCloud)
        }
        
        clouds = shuffle(cloudsArray: clouds)
        
        return clouds
    }
    
    func randomBetweenNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    
    // Arranges clouds, create initial clouds and if the game has started add new clouds
    func arrangeCloudsInScene ( scene: SKScene, distanceBetweenClouds: CGFloat, center: CGFloat, minX: CGFloat, maxX: CGFloat, initialClouds: Bool) {
        
        var clouds = createClouds()
        
        if (initialClouds) {
            
            while(clouds[0].name == "Dark Cloud") {
                // shuffle the cloud array
                clouds = shuffle(cloudsArray: clouds)
            }
            
        }
        
        var positionY = CGFloat()
        
        if initialClouds{
            positionY = center - 100
        } else {
            positionY = lastCloudPositionY
        }
        
        var random = 0
        
        // Place clouds right then left
        for i in 0...clouds.count - 1 {
            
            var randomX = CGFloat()
            if random == 0 {
                randomX = randomBetweenNumbers(firstNum: +90, secondNum: maxX)
                random = 1
            } else if random == 1 {
                randomX = randomBetweenNumbers(firstNum: -90, secondNum: minX)
                random = 0
            }
            
            clouds[i].position = CGPoint(x: randomX, y: positionY)
            clouds[i].zPosition = 3
            
            // Spawn collectables if not on top of a darkcloud 
            if !initialClouds {
                
                if Int(randomBetweenNumbers(firstNum: 0, secondNum: 7)) >= 3 {
                    
                    if clouds[i].name != "Dark Cloud" {
                        let collectable = collectableController.getCollectable()
                        collectable.position = CGPoint(x: clouds[i].position.x, y: clouds[i].position.y + 60)
                        
                        // Add collectable to scene
                        scene.addChild(collectable)

                    }
                    
                }
            }
            
            scene.addChild(clouds[i])
            positionY -= distanceBetweenClouds
            lastCloudPositionY = positionY
        }
    }
}
