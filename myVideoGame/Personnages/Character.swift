//
//  Character.swift
//  myVideoGame
//
//  Created by Diewo Wandianga on 29/12/2019.
//  Copyright © 2019 Diewo Wandianga. All rights reserved.
//

import Cocoa

class Personnage {
    
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
    func attack (adversaire: Personnage) {
        
        adversaire.lifepoints = adversaire.lifepoints - weapon.damage
        
        if adversaire.lifepoints <= 0 {
            print("\(adversaire.name) is dead")
            adversaire.player.diesCharacter += 1
            adversaire.player.livingCharacter.removeAll {
                (character) -> Bool in
                if adversaire.name == character.name {
                    // si le nom de notre adversaire est = au character.name que l'on trouve dans le tableau des personnes vivantes tu l'enlèves
                    return true
                } else {
                    return false
                }
            }
            adversaire.player.deadCharacter.append(adversaire)
        } else {
            print("\(adversaire.name) is now \(adversaire.lifepoints) LP")
        }
        
    }
    func healCharacter (personnage: Personnage) {
        personnage.lifepoints = personnage.lifepoints + heal
        print("\(personnage.name) is now \(personnage.lifepoints) LP")
    }
}
