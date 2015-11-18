//
//  EntityController.swift
//  sixWeekChallenge
//
//  Created by Sean Chang on 11/18/15.
//  Copyright © 2015 Sean Chang. All rights reserved.
//

import Foundation

class EntityController {
    private let entityAKey = "entitiesA"
    
    static let sharedController = EntityController()
    
    var entitiesA: [EntityA]
    
    
    init() {
        self.entitiesA = []
    
        self.loadFromPersStorage()
    }

    func addEntityA(entityA: EntityA) {
        
        entitiesA.append(entityA)
        
        self.saveToPersStorageA()
    }
//    
//    func addEntityB(entityB: EntityB) {
//        
//        entitiesB.append(entityB)
//        
//        self.saveToPersStorageB()
//    }
    
    func saveToPersStorageA() {
        
        let entityADictionaries = self.entitiesA.map({$0.dictionaryCopy()})
        
        NSUserDefaults.standardUserDefaults().setObject(entityADictionaries, forKey: entityAKey)
    }
//    
//    func saveToPersStorageB() {
//        
//        let entityBDictionaries = self.entitiesB.map({$0.dictionaryCopy()})
//        
//        NSUserDefaults.standardUserDefaults().setObject(entityBDictionaries, forKey: entityBKey)
//    }
    
    func loadFromPersStorage() {
        let entityADictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(entityAKey) as? [Dictionary<String, AnyObject>]
        
        if let entityADictionaries = entityADictionariesFromDefaults {
            
            self.entitiesA = entityADictionaries.map({EntityA(dictionary: $0)!})
        }
        
 
    }
    
    func removeEntityA(entityA: EntityA) {
        
        if let entityAIndex = entitiesA.indexOf(entityA) {
            entitiesA.removeAtIndex(entityAIndex)
            
        }
    }
    
//    func removeEntityB(entityB: EntityB) {
//        
//        if let entityBIndex = entitiesB.indexOf(entityB) {
//            entitiesB.removeAtIndex(entityBIndex)
//        }
//    }
}