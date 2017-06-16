//
//  BGClass.swift
//  Jack The Giant
//
//  Created by Matthew Bortolin on 16/6/17.
//  Copyright © 2017 Matthew Bortolin. All rights reserved.
//

import SpriteKit

class BGClass: SKSpriteNode {
    
    // Create an infinite background
    func moveBG(camera: SKCameraNode) {
        if self.position.y - self.size.height - 10 > camera.position.y {
            self.position.y -= self.size.height * 3
        }
    }
}
