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
    var selectedCharacter: Personnage?
    
    private var value : Int = Int()
    
    init() { }
    
    func introduction() {
        print("Welcome in French Game Factory!\nSelect the name of your characters\n")
    }
    
    func launchTurn() {
        chooseCharacter()
        chooseAction()
        gateBox()
        doAction()
        
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
        print("MAX", maxInt, "MIN", minInt)
        
        isPlayerOneTurn ? print("\nPlayerOne: Please choose a character") :
            // si c'est au tour du joueur 1 print ->
            print("\nPlayerTwo: Please choose a character")
        securePlayerGaming.printLivingCharacter()
        //print("What's your choice ? : please pick number")
        print("What's your choice ? : please choose character name")
        
        //        var index: Int = Int() // index est le nombre que la personne va entrer dans la console
        var isFind: Bool = false 
        
        repeat {
            let value = Tools.shared.readlineString()
            if let perso = securePlayerGaming.livingCharacter.first(where: {$0.name == value}){ // $0 est un personnage,
                
                
                selectedCharacter = perso
                guard let secureSelectedCharacter = selectedCharacter else {return}
                
                print("Vous avez choisi : \n",secureSelectedCharacter.name, secureSelectedCharacter.lifepoints,secureSelectedCharacter.weapon.damage)
                isFind = true // c'est qu'on l'a trouvé
            } else {
                print("Please choose a living character")
                isFind = false
            }
            
            //            }
            
        } while !isFind
        
        //index < minInt || index > maxInt
        //        selectedCharacter = securePlayerGaming.livingCharacter[index]
        //        print(index, "")
        //        print(selectedCharacter?.name)
        
        // ctrl i
        
    }
    func chooseAction() {
        
        guard let secureSelectedCharacter = selectedCharacter else {return}
        
        
        
        isPlayerOneTurn ? print("\nPlayerOne : What kind of action do you want to do? : ") : print("\nPlayerTwo : What kind of action do you want to do? : ")
        
        print("1 : Attack an ennemy || WPD :\(secureSelectedCharacter.weapon.damage)")
        print("2 : Heal an ally || HEAL :\(secureSelectedCharacter.heal)")
        
        repeat {
            value = Tools.shared.readlineInt()
            if value < 1 || value > 2 {
                print("Number should be 1 or 2")
            }
            
            
        } while value < 1 || value > 2
        
    }
    func gateBox() {
        
        var index: Int = 0
        let randomgateBox : Int = Int.random(in:1...10)
        
        if randomgateBox == 5 {
            let lootWeapon : Int = LootBox().damage
            
            print("\nA loot just appear, it contains a weapon that makes : \(lootWeapon) damage")
            print("Do you want to take it?(1 for yes, 2 for no)")
            
            repeat {
                index = Tools.shared.readlineInt()
                if index < 1 || index > 2 {
                    print("Number should be 1 or 2")
                }
            } while index < 1 || index > 2
            if index == 1 {
                selectedCharacter?.weapon.damage = lootWeapon
            }
            

            
        }
        
    }
    
    private func doAction() {
        guard let securePlayerGaming = playerGaming else { return }
        guard let securePlayerWaiting = playerWaiting else { return }
        guard let secureSelectedCharacter = selectedCharacter else { return }
        
        
        isPlayerOneTurn ? print("\nPlayerOne : Choose on wich character you want to perform an action") : print("\nPlayerTwo : Choose on wich character you want to perform an action")
        
        var isAttacking: Bool?
        
        
        let maxInt: Int = securePlayerWaiting.livingCharacter.count - 1
        let minInt: Int = securePlayerWaiting.livingCharacter.count - (maxInt) - 1
        print("MAX", maxInt, "MIN", minInt)
        
        if value == 1 {
            securePlayerWaiting.printLivingCharacter()
            isAttacking = true
            
        } else if value == 2 {
            securePlayerGaming.printLivingCharacter()
            isAttacking = false
        }
        guard let secureIsAttacking = isAttacking else { return }
        
        repeat {
            value = Tools.shared.readlineInt() - 1
            
            if value < minInt || value > maxInt {
                print("Number should be between \(minInt + 1) and \(maxInt + 1)")
            }
        } while value < minInt || value > maxInt
        if secureIsAttacking {
            let target = securePlayerWaiting.livingCharacter[value]
            secureSelectedCharacter.attack(adversaire: target)
        } else {
            let target = securePlayerGaming.livingCharacter[value]
            secureSelectedCharacter.healCharacter(personnage: target)
        }
        isPlayerOneTurn.toggle()
        
        if !isPlayerOneTurn  {
            Tools.shared.increaseTurn()
        }
        
        if !(securePlayerGaming.diesCharacter == 3) && !(securePlayerWaiting.diesCharacter == 3) {
            launchTurn()
        } else {
            print("Game is finished")
        }
        
    }
}

// 14h
// switch case
