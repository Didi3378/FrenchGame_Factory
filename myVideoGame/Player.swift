//
//  Player.swift
//  myVideoGame
//
//  Created by Diewo Wandianga on 12/01/2020.
//  Copyright © 2020 Diewo Wandianga. All rights reserved.
//

class Player {
    var livingCharacter: [Personnage] = [Personnage]()
    var deadCharacter: [Personnage] = [Personnage]()
    var diesCharacter: Int = 0
    // écrire une fonction qui affiche le nombre de "character en vie"
    // écrire une fonction qui affiche le nombre de "character mort"
    //personnage.name (print)
    //personnage.lifepoints
    //créer 2 personnages perso1 et perso2 et les ajouter au tableau
    
    init(names: [String]) { // tableau de noms 
        names.forEach { (names) in
            livingCharacter.append(Personnage(player: self, name: names))
            
            // init sert, for
        }
    }
    
    func printLivingCharacter() {
        livingCharacter.enumerated().forEach {
            
            (index, element) in
            
            print("\(index + 1) \(element.lifepoints) - LP", "\(element.weapon.damage)   - WPD",  "(\(element.name))   - NAME"
            )
            // afficher nom des characters, lifepoints, weapon damage
            // revoir présentation + push sur github Attention !!!!! sauvegarder sur clé usb avant de faire le push
//j'ai ajouté index
//func pick number ?
            
        } 
        
    }
    func printDeadCharacter() {
        deadCharacter.enumerated().forEach {
            
            (index, element) in
            print(element.name)
        }
        
    }
}


