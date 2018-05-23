//
//  User+CoreDataClass.swift
//  Clase7Mod2
//
//  Created by alumno on 5/21/18.
//  Copyright © 2018 Area51. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

@objc(User)
public class User: NSManagedObject {
    
    static func current() -> User? {
        
        guard let app = UIApplication.shared.delegate as? AppDelegate else { return nil }
        let contex = app.persistentContainer.viewContext
        
        let fetch = NSFetchRequest<User>(entityName: "User")
        
        do {
            let result = try contex.fetch(fetch).first
            return result
        }catch let error {
            print(error.localizedDescription)
            return nil
        }

    }

}
