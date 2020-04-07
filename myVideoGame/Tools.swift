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
    
    // MARK: - Attributs
    var numberOfturn: Int = 0
    
    // MARK: - METHODS
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
        numberOfturn = numberOfturn + 1 
        
    }
}






