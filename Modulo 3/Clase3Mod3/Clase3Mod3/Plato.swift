//
//  Plato.swift
//  Clase3Mod3
//
//  Created by alumno on 5/30/18.
//  Copyright © 2018 alumno. All rights reserved.
//

import Foundation

struct Plato: Decodable {
    let name: String
    let origin: String
    let price: Double
    let country: String = "Perú"
    let ids: String
    let ingredientes: [Item]

}
extension Plato {
    
    enum CodingKeys: String, CodingKey {
        case name
        case origin
        case price
        case ids = "user_ids"
        case ingredientes
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.origin = try container.decode(String.self, forKey: .origin)
        self.price = try container.decode(Double.self, forKey: .price)
        self.ids = try container.decode(String.self, forKey: .ids)
        self.ingredientes = try container.decode([Item].self, forKey: .ingredientes)

    }
    
}

