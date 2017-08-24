//
//  GameData.swift
//  Jack The Giant
//
//  Created by Matthew Bortolin on 24/8/17.
//  Copyright © 2017 Matthew Bortolin. All rights reserved.
//

import SpriteKit

class GameData: NSObject, NSCoding {
    
    struct Keys {
        static let EasyDifficultyScore = "EasyDifficultyScore"
        static let MediumDifficultyScore = "MediumDifficultyScore"
        static let HardDifficultyScore = "HardDifficultyScore"
        
        static let EasyDifficultyCoinScore = "EasyDifficultyCoinScore"
        static let MediumDifficultyCoinScore = "MediumDifficultyCoinScore"
        static let HardDifficultyCoinScore = "HardDifficultyCoinScore"
        
        static let EasyDifficulty = "EasyDifficulty"
        static let MediumDifficulty = "MediumDifficulty"
        static let HardDifficulty = "HardDifficulty"

        static let Music = "Music"
    }
    
    private var easyDifficultyScore = Int32()
    private var mediumDifficultyScore = Int32()
    private var hardDifficultyScore = Int32()
    
    private var easyDifficultyCoinScore = Int32()
    private var mediumDifficultyCoinScore = Int32()
    private var hardDifficultyCoinScore = Int32()
    
    private var easyDifficulty = false
    private var mediumDifficulty = false
    private var hardDifficulty = false
    
    private var isMusicOn = false
    
    override init() {}
    
    // Reload Data
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        // Reload Score, Coin Score
        self.easyDifficultyScore = aDecoder.decodeCInt(forKey: Keys.EasyDifficultyScore)
        self.easyDifficultyCoinScore = aDecoder.decodeCInt(forKey: Keys.EasyDifficultyCoinScore)
        
        self.mediumDifficultyScore = aDecoder.decodeCInt(forKey: Keys.MediumDifficultyScore)
        self.mediumDifficultyCoinScore = aDecoder.decodeCInt(forKey: Keys.MediumDifficultyCoinScore)
        
        self.hardDifficultyScore = aDecoder.decodeCInt(forKey: Keys.HardDifficultyScore)
        self.hardDifficultyCoinScore = aDecoder.decodeCInt(forKey: Keys.HardDifficultyCoinScore)
        
        // Reload Difficulty
        self.easyDifficulty = aDecoder.decodeBool(forKey: Keys.EasyDifficulty)
        self.mediumDifficulty = aDecoder.decodeBool(forKey: Keys.MediumDifficulty)
        self.hardDifficulty = aDecoder.decodeBool(forKey: Keys.HardDifficulty)
        
        // Reload if music is on or off
        self.isMusicOn = aDecoder.decodeBool(forKey: Keys.Music)
        
    }
    
    // Save Data
    func encode(with aCoder: NSCoder) {
        
        // Save Score, Coin Score
        aCoder.encode(self.easyDifficultyScore, forKey: Keys.EasyDifficultyScore)
        aCoder.encode(self.easyDifficultyCoinScore, forKey: Keys.EasyDifficultyCoinScore)
        
        aCoder.encode(self.mediumDifficultyScore, forKey: Keys.MediumDifficultyScore)
        aCoder.encode(self.mediumDifficultyCoinScore, forKey: Keys.MediumDifficultyCoinScore)
        
        aCoder.encode(self.hardDifficultyScore, forKey: Keys.HardDifficultyScore)
        aCoder.encode(self.hardDifficultyCoinScore, forKey: Keys.HardDifficultyCoinScore)
        
        // Save Difficulty
        aCoder.encode(self.easyDifficulty, forKey: Keys.EasyDifficulty)
        aCoder.encode(self.mediumDifficulty, forKey: Keys.MediumDifficulty)
        aCoder.encode(self.hardDifficulty, forKey: Keys.HardDifficulty)
        
        // Save if muisc is on or off
        aCoder.encode(self.isMusicOn, forKey: Keys.Music)

    }
    
    // Easy Difficulty
    func setEasyDifficultyScore(easyDifficultyScore: Int32) {
        self.easyDifficultyScore = easyDifficultyScore
    }
    
    func getEasyDifficultyScore() -> Int32 {
        return self.easyDifficultyScore
    }
    
    func setEasyDifficultyCoinScore(easyDifficultyCoinScore: Int32) {
        self.easyDifficultyCoinScore = easyDifficultyCoinScore
    }
    
    func getEasyDifficultyCoinScore() -> Int32 {
        return self.easyDifficultyCoinScore
    }
    
    func setEasyDifficulty(easyDifficulty: Bool) {
        self.easyDifficulty = easyDifficulty
    }
    
    func getEasyDifficulty() -> Bool {
        return self.easyDifficulty
    }
    
    // Medium Difficulty
    func setMediumDifficultyScore(mediumDifficultyScore: Int32) {
        self.mediumDifficultyScore = mediumDifficultyScore
    }
    
    func getMediumDifficultyScore() -> Int32 {
        return self.mediumDifficultyScore
    }
    
    func setMediumDifficultyCoinScore(mediumDifficultyCoinScore: Int32) {
        self.mediumDifficultyCoinScore = mediumDifficultyCoinScore
    }
    
    func getMediumDifficultyCoinScore() -> Int32 {
        return self.mediumDifficultyCoinScore
    }
    
    func setMediumDifficulty(mediumDifficulty: Bool) {
        self.mediumDifficulty = mediumDifficulty
    }
    
    func getMediumDifficulty() -> Bool {
        return self.mediumDifficulty
    }

    // Hard Difficulty
    func setHardDifficultyScore(hardDifficultyScore: Int32) {
        self.hardDifficultyScore = hardDifficultyScore
    }
    
    func getHardDifficultyScore() -> Int32 {
        return self.hardDifficultyScore
    }
    
    func setHardDifficultyCoinScore(hardDifficultyCoinScore: Int32) {
        self.hardDifficultyCoinScore = hardDifficultyCoinScore
    }
    
    func getHardDifficultyCoinScore() -> Int32 {
        return self.hardDifficultyCoinScore
    }
    
    func setHardDifficulty(hardDifficulty: Bool) {
        self.hardDifficulty = hardDifficulty
    }
    
    func getHardDifficulty() -> Bool {
        return self.hardDifficulty
    }

    // Music
    func setIsMusicOn(isMusicOn: Bool) {
        self.isMusicOn = isMusicOn
    }
    
    func getIsMusicOn() -> Bool {
        return self.isMusicOn
    }

}
