//
//  Place.swift
//  Clase6Mod2
//
//  Created by alumno on 18/05/18.
//  Copyright © 2018 Area51. All rights reserved.
//

import Foundation
import MapKit

class Place: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    
    init(title: String, subtitle: String, price: Double, coordinate: CLLocationCoordinate2D) {
        
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        
    }

}
