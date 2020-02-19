//
//  Weapon.swift
//  myVideoGame
//
//  Created by Diewo Wandianga on 29/12/2019.
//  Copyright © 2019 Diewo Wandianga. All rights reserved.
//

import Cocoa

class Weapon {
    var weaponName: String = ""
    var damage: Int = Int.random(in: 1...50)
    
    init() {
        
    }
}
// chercher comment faire un random.
//
//let randomInt = Int.random(in: 1...5)
//let randomDouble = Double.random(in: 1...100)
//let randomFloat = Float.random(in: 1..<10)
//let randomBool = Bool.random()
// pour générer des nombres aléatoires 

