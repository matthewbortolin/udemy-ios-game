//
//  HighScoreScene.swift
//  Jack The Giant
//
//  Created by Matthew Bortolin on 16/6/17.
//  Copyright © 2017 Matthew Bortolin. All rights reserved.
//

import SpriteKit

class HighScoreScene: SKScene {
    
    var backBtn: SKSpriteNode?
    
    override func didMove(to view: SKView) {
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            // Return back to the main menu
            if nodes(at: location)[0].name == "Back" {
                let scene = MainMenuScene(fileNamed: "MainMenu")
                scene!.scaleMode = .aspectFill
                
                self.view?.presentScene(scene!, transition: SKTransition.doorsCloseVertical(withDuration: 1))

            }
        }
    }
}
