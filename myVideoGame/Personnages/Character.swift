//
//  Character.swift
//  myVideoGame
//
//  Created by Diewo Wandianga on 29/12/2019.
//  Copyright © 2019 Diewo Wandianga. All rights reserved.
//

import Cocoa

//class Personnage {
    
 //   let name: String
   // var lifePoints: Int = 100
 //   var weapon: Weapon = Weapon()

  //  init(characterName: String, lifePoints: Int, weapon: Weapon) {
    //     self.name = characterName
    //    self.lifePoints = lifePoints
      //  self.weapon = weapon
    
   // }
    //func attack(adversaire: Personnage) -> Personnage {
      //  adversaire.lifePoints = adversaire.lifePoints - weapon.damage
        
       // return adversaire
    //}
    //}


//Creer une methode (fonction) "attack" elle va prendre en parametre un personnage et elle va attaquer un character ennemi.
//Si le personnage ennemi est mort écrire le personnage est mort sinon ecrire le nombre de points de vie du personnage ennemi


//class Weapon {
//    var weaponName: String
//    var damage: Int
//    init(weaponName: String, damage: Int) {
//        self.weaponName = weaponName
//        self.damage = damage
//    }
//}



class Personnage {
    let player: Player
    var name: String
    var lifepoints: Int = 100
    var weapon : Weapon = Weapon()
    var heal: Int = Int.random(in: 10..<40)
    
    init (player: Player, name: String) {
        self.player = player
        self.name = name
        
        
    }
    
    func attack (adversaire: Personnage) {
        
        adversaire.lifepoints = adversaire.lifepoints - weapon.damage
        
        if adversaire.lifepoints <= 0 {
            print("\(adversaire.name) is dead")
            adversaire.player.livingCharacter.removeAll {
                // removeAll ou "where": ""Removes all the elements that satisfy the given predicate." -> ça va supprimer tout ce qui satisfait la condition qu'on lui passe à l'intérieur. La condition c'est adversaire.name == character.name. La boucle traverse tous les noms dans le tableau des personnes vivantes et supprimer tous les éléments qui ont le même nom.
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

// revoir le where (removeAll) et énumérer les choses manquantes pour terminer le jeu

/* Choses manquantes
* Une fois la partie terminée (lorsque tous les personnages d’une équipe sont morts), tu affiches le joueur qui a gagné et les statistiques de jeu : le nombre de tours et la liste des personnages des deux équipes avec leurs propriétés (point de vie, etc.).
 func avec print "joueur qui a gagné
 func avec stats : nombre de tours et la liste des personnages des 2 équipes : lifepoints, name, weapon etc.....
 
 * un coffre peut apparaître devant un personnage quand celui joue son tour (random ?). Ce coffre contiendra forcément une arme (plus ou moins puissante que celle existante).*/

// removeAll : ""Removes all the elements that satisfy the given predicate." -> ça va supprimer tous les éléments qui satisfont la condition que tu vas lui passer. La condition c'est le nom et supprimer tous les éléments qui ont le même nom.
