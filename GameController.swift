//
//  GameController.swift
//  Jack The Giant
//
//  Created by Matthew Bortolin on 23/8/17.
//  Copyright © 2017 Matthew Bortolin. All rights reserved.
//

import Foundation
import SpriteKit

class GameManager {
    
    static let instance = GameManager()
    private init() {}
    
    var gameStartedFromMainMenu = false
    var gameRestartedPlayerDied = false
}
