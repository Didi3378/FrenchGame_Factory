//
//  Tools.swift
//  myVideoGame
//
//  Created by Diewo Wandianga on 13/01/2020.
//  Copyright © 2020 Diewo Wandianga. All rights reserved.
//

import Foundation

// Boite à outils

class Tools {
    // MARK: - Singleton : c'est une classe qui reste toujours allumé 
    var numberOfturn: Int = 0
    
    static let shared: Tools = Tools()
    
    func readlineString() -> String {
        let str = readLine()
        guard let strData = str else {return ""}
        
        return strData
        
    }
    
    func readlineInt() -> Int {
        let data = readLine()
        guard let strData = data, let strDataInt = Int(strData) else {return -1}
        
        return strDataInt
    }
    
    func increaseTurn() {
        numberOfturn = numberOfturn + 1 // numberOfturn += 1
        
    }

    
// créer fonction readlineString elle va lire une String et l'a retourné,
    
        
     //   guard let maString = string else { return } print(maString)
    
    }
    
// guard let sert à sécuriser mon readLine ou un optionnel pour éviter que mon application crash.

// créer une fonction readline Int (demander comment passer de string à int)


// La commande  readLine permet d'interagir avec l'utilisateur en écoutant ce qu'il va écrire. Elle renvoie un  String? qu'il faut du coup déballer.
//gérer l'interaction avec le terminal - quand le programme rencontre la méthode readline il va s'interrompre et attendre que l'utilisateur écrive quelque chose. La fonction readline a pour retour un optionnel, l'utilisateur pourrait ne pas répondre la variable contiendrait "nil". Pour palier à cela il faut déballer notre programme de manière sécurisée :

//print("Comment vous appelez vous ?")
// if let name = readLine() {
// print("Bonjour \(name)")




