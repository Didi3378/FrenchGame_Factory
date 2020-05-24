//
//  Character.swift
//  myVideoGame
//
//  Created by Diewo Wandianga on 29/12/2019.
//  Copyright © 2019 Diewo Wandianga. All rights reserved.
//

import Cocoa

class Character {
    
    // MARK: - Attributs
    let player: Player
    var name: String
    var lifepoints: Int = 100
    var weapon : Weapon = Weapon()
    var heal: Int = Int.random(in: 10..<40)
    
    
    // MARK: - Constructor
    init (player: Player, name: String) {
        self.player = player
        self.name = name
    }
    // MARK: - METHODS
    func attack (ennemy: Character) {
        
        ennemy.lifepoints = ennemy.lifepoints - weapon.damage
        
        if ennemy.lifepoints <= 0 {
            print("\(ennemy.name) is dead")
            ennemy.player.diesCharacter += 1
            ennemy.player.livingCharacter.removeAll {
                (character) -> Bool in
                if ennemy.name == character.name {
                    
                    return true
                } else {
                    return false
                }
            }
            ennemy.player.deadCharacter.append(ennemy)
        } else {
            print("\(ennemy.name) is now \(ennemy.lifepoints) LP")
        }
        
    }
    func healCharacter (character: Character) {
        character.lifepoints = character.lifepoints + heal
        print("\(character.name) is now \(character.lifepoints) LP")
    }
}
