//
//  CoreDataStack.swift
//  Clase2Mod3_2
//
//  Created by Area51 on 8/29/18.
//  Copyright © 2018 Area51. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    private var modelName: String
    
    
    init(name: String) {
        self.modelName = name
    }
    
    lazy var container: NSPersistentContainer = {
        
        let c = NSPersistentContainer(name: self.modelName)
        c.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
                print(error)
            }
            
        })
        
        return c
    }()
    
    
}
