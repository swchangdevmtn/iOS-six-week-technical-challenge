//
//  EntityB.swift
//  sixWeekChallenge
//
//  Created by Sean Chang on 11/18/15.
//  Copyright © 2015 Sean Chang. All rights reserved.
//

import Foundation

class EntityB: Equatable {
    
    private let nameKey = "name"
    private let pairKey = "pair"
    
    var name: String
    var pair: String
    
    init(name: String, pair: String) {
        
        self.name = name
        self.pair = pair
    }
    
    init?(dictionary: Dictionary<String, AnyObject>) {
        guard let name = dictionary[nameKey] as? String,
            let pair = dictionary[pairKey] as? String else {
                
                // sets values for stored properties due to requirement as of Swift 2.0
                
                self.name = ""
                self.pair = ""
                
                return nil
        }
        
        self.name = name
        self.pair = pair
        
    }
    
    func dictionaryCopy() -> Dictionary<String, AnyObject> {
        
        let dictionary = [
            nameKey : self.name,
            pairKey : self.pair
        ]
        
        return dictionary
    }
}


func == (lhs: EntityB, rhs: EntityB) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}