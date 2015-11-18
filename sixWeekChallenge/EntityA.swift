//
//  entity.swift
//  sixWeekChallenge
//
//  Created by Sean Chang on 11/18/15.
//  Copyright © 2015 Sean Chang. All rights reserved.
//

import Foundation

class Entity: Equatable {
    
    private let listKey = "list"
    private let nameKey = "name"
    private let pairKey = "pair"

    var list: String
    var name: String
    var pair: String
    
    init(list: String, name: String, pair: String) {
        self.list = list
        self.name = name
        self.pair = pair
    }
    
    init?(dictionary: Dictionary<String, AnyObject>) {
        guard let list = dictionary[listKey] as? String,
            let name = dictionary[nameKey] as? String,
        let pair = dictionary[pairKey] as? String else {
                
                // sets values for stored properties due to requirement as of Swift 2.0
                self.list = ""
                self.name = ""
                self.pair = ""
                
                return nil
        }
        
        self.list = list
        self.name = name
        self.pair = pair
        
    }
    
    func dictionaryCopy() -> Dictionary<String, AnyObject> {
        
        let dictionary = [
            listKey : self.list,
            nameKey : self.name,
            pairKey : self.pair
        ]
        
        return dictionary
    }
}


func == (lhs: Entity, rhs: Entity) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}