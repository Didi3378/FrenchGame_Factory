//
//  Game.swift
//  myVideoGame
//
//  Created by Diewo Wandianga on 29/12/2019.
//  Copyright © 2019 Diewo Wandianga. All rights reserved.
//

import Cocoa

class Game {
    
    var playerOne: Player?
    var playerTwo: Player?
    var isPlayerOneTurn: Bool = true
    var playerGaming: Player?
    var playerWaiting: Player?
    
    init() { }
    
    func introduction() {
        print("Welcome in French Game Factory!\nSelect the name of your characters\n")
    }
    
    func askNameCharacter() { 
        var characterNameArray: [String] = [String]()
        
        repeat {
            print("Player 1 -> :")
            var verify: Bool = false
            repeat {
                let name = Tools.shared.readlineString()
                
                if !characterNameArray.contains(name) {
                    if !name.isEmpty {
                        
                        verify = true
                        characterNameArray.append(name)
                    } else {
                        print("veuillez entrer le nom d'un personnage svp")
                        
                    }
                    
                    
                } else {
                    print("name is already taken")
                } //Vérifier que la variable name ne soit pas vide (= String vide)
            } while verify == false // tant que
            
        } while characterNameArray.count != 3
        print("Voici les noms: ", characterNameArray[0], characterNameArray[1], characterNameArray[2])
        
        playerOne = Player(names: [characterNameArray[0], characterNameArray[1], characterNameArray[2]])
        
        repeat {
            print("Player 2 -> :")
            var verify: Bool = false
            repeat {
                let name = Tools.shared.readlineString()
                
                if !characterNameArray.contains(name) {
                    verify = true
                    if !name.isEmpty {
                        
                        verify = true
                        characterNameArray.append(name)
                    } else {
                        print("veuillez entrer le nom d'un personnage svp")
                        
                    }
                    
                } else {
                    print("name is already taken")
                } 
                
            } while verify == false // tant que
            
        } while characterNameArray.count != 6
        print("Voici les noms: ", characterNameArray[3], characterNameArray[4], characterNameArray[5])
        playerTwo = Player(names: [characterNameArray[3], characterNameArray[4], characterNameArray[5]])
    }
    func chooseCharacter() {
        //        playerGaming = (isPlayerOneTurn) ? playerOne : playerTwo
        if isPlayerOneTurn {
            playerGaming = playerOne
        } else {
            playerGaming = playerTwo
        }
        guard let securePlayerGaming = playerGaming else {return}
        
        let maxInt: Int = securePlayerGaming.livingCharacter.count - 1
        let minInt: Int = securePlayerGaming.livingCharacter.count - (maxInt) - 1
        
        isPlayerOneTurn ? print("\nPlayerOne: Please choose a character") : print("\nPlayerTwo: Please choose a character")
        securePlayerGaming.printLivingCharacter()
        print("What's your choice ? : pick number")
    }
    
    
    
}

func endOfTheParty () {
    let player = Player(names: ["tutu", "tata", "toto"])
    
}



// réviser repeat et while
// blocs d'instructions
// lundi 20h
// mercredi 20h -> révisez repeat et while, les singletons, les fonctions avec prises de variables, exos
// diagramme de classes, ......


// Instructions 2
//2. Réaliser le combat au tour par tour. L’idée, c’est donc que le joueur 1 puisse choisir un personnage de son équipe, choisir le personnage qui va subir l’action (dans l’équipe adverse en cas d’attaque ou dans son équipe en cas de soin), de réaliser l’action, puis de vérifier si la partie est terminée, sinon c’est au tour du joueur 2 ;
//a -> class Combat avec une func fight, func soin
//b -> tableau personnages qui combattent, lorsque l'un d'entre eux qu'on ne puisse plus le choisir puis choisir un autre joueur
//c -> utiliser condition "si personnage dead", choisir un autre joueur
//d -> méthode partie terminée : faire jouer le player 2




// Vérifier que la variable name ne soit pas vide (= String vide)
//



