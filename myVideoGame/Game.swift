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
    var isPlayerOneTurn: Bool = true // cette var me permet de savoir si c'est au tour du joueur 1 ou du joueur 2
    var playerGaming: Player?
    var playerWaiting: Player?
    var selectedCharacter: Personnage?
    
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
        if isPlayerOneTurn { // on vérifie cette variable
            playerGaming = playerOne
            // si c'est le tour du joueur 1
        } else {
            playerGaming = playerTwo
        }
        guard let securePlayerGaming = playerGaming else {return}
        
        let maxInt: Int = securePlayerGaming.livingCharacter.count - 1
        let minInt: Int = securePlayerGaming.livingCharacter.count - (maxInt) - 1
        print("MAX", maxInt, "MIN", minInt) // gestion d'erreurs : permet d'établir une fourchette à ne pas dépasser minInt: 1, maxInt : 3
        
        isPlayerOneTurn ? print("\nPlayerOne: Please choose a character") :
            // si c'est au tour du joueur 1 print ->
            print("\nPlayerTwo: Please choose a character")
        securePlayerGaming.printLivingCharacter()
        print("What's your choice ? : please pick number")
        
        var index: Int = Int() // index est le nombre que la personne va entrer dans la console
        
        repeat {
            index = Tools.shared.readlineInt() - 1 // - 1 en référence au let maxInt et let minInt
            if index < minInt || index > maxInt {
                print("Choose a number between \(minInt + 1) and \(maxInt + 1)")
            }
            
        } while index < minInt || index > maxInt
        selectedCharacter = securePlayerGaming.livingCharacter[index]
        print(index, "")
        print(selectedCharacter?.name)
            
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

// \n pour faire un saut

