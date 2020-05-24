//
//  Player.swift
//  myVideoGame
//
//  Created by Diewo Wandianga on 12/01/2020.
//  Copyright © 2020 Diewo Wandianga. All rights reserved.
//

class Player {
    
    // MARK: - Attributs
    var livingCharacter: [Character] = [Character]()
    var deadCharacter: [Character] = [Character]()
    var diesCharacter: Int = 0
    
    // MARK: - Constructor
    init(names: [String]) {
        names.forEach { (names) in
            livingCharacter.append(Character(player: self, name: names))
        }
    }
    // MARK: - METHODS
    func printLivingCharacter() {
        livingCharacter.enumerated().forEach {
            
            (index, element) in
            
            print("\(index + 1).", "(\(element.lifepoints) - LP) ||", "(\(element.weapon.damage) - WPD) ||",  "(\(element.name) - NAME)")
            
        } 
        
    }
    func printDeadCharacter() {
        deadCharacter.enumerated().forEach {
            
            (index, element) in
            print(element.name)
        }
        
    }
}


