//
//  Car+CoreDataProperties.swift
//  Clase7Mod2
//
//  Created by alumno on 5/21/18.
//  Copyright © 2018 Area51. All rights reserved.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var brand: String?
    @NSManaged public var model: String?
    @NSManaged public var user: User?

}
