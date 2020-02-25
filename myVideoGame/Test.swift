//
//  Test.swift
//  myVideoGame
//
//  Created by Diewo Wandianga on 20/01/2020.
//  Copyright © 2020 Diewo Wandianga. All rights reserved.
//

import Foundation

class Test {
    
    static let shared: Test = Test()
    
    func affNumber() {
        var i = 0
        repeat {
            print("bonjour")
            i += 1 // i = i + 1
        } while i < 3
    }
    
    func affNumber2(variable: Int) {
        var i = 0
        repeat {
            print("hello")
            i += 1
        } while i < variable
        
    }
    
}

class Poire {
    
    static let shared: Poire = Poire()
    
    
}

// repeat while : est une boucle, il faut une variable qui va te servir de compteur. A chaque fois elle va augmenter. 

// singleton :

// 
