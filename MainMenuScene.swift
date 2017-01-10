//
//  MainMenuScene.swift
//  Jack The Giant
//
//  Created by Matthew Bortolin on 16/6/17.
//  Copyright © 2017 Matthew Bortolin. All rights reserved.
//

import SpriteKit

class MainMenuScene: SKScene {
    
    var highScoreBtn: SKSpriteNode?
    
    override func didMove(to view: SKView) {
        
       highScoreBtn = self.childNode(withName: "High Score") as? SKSpriteNode!
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
            
            // Go to the Game
            if nodes(at: location)[0].name == "Start Game"{
                let scene = GameplayScene(fileNamed: "GameplayScene")
                scene!.scaleMode = .aspectFill
                
                self.view?.presentScene(scene!, transition: SKTransition.doorsCloseVertical(withDuration: 1))
            }

            // Go to the High Score Scene
            if nodes(at: location)[0].name == "High Score"{
                let scene = HighScoreScene(fileNamed: "HighScoreScene")
                scene!.scaleMode = .aspectFill
                
                self.view?.presentScene(scene!, transition: SKTransition.doorsCloseVertical(withDuration: 1))
            }
            
            // Go to the Options Scene
            if nodes(at: location)[0].name == "Options"{
                let scene = OptionsScene(fileNamed: "OptionsScene")
                scene!.scaleMode = .aspectFill
                
                self.view?.presentScene(scene!, transition: SKTransition.doorsCloseVertical(withDuration: 1))
            }

        }
    }
}
