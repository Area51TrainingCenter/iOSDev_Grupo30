//
//  Local.swift
//  Clase3Mod3
//
//  Created by alumno on 5/30/18.
//  Copyright © 2018 alumno. All rights reserved.
//

import Foundation

class Local {
    /*
     fuente de datos local
 */
    static func items() -> Data {
        
        let json = """
                    [
                        {
                            "name": "Sopa de cauche",
                            "origin": "Arequipa",
                            "price": 12.4,
                            "country": "Arequipa",
                            "user_ids": "1",
                            "ingredientes": ["principal": "e1",
                                            "secondary": "e2"
                                            ]
                        },
                        {
                            "name": "Chupe de camarones",
                            "origin": "Lima",
                            "price": 35.5,
                            "country": "Perú",
                            "user_ids": "5",
                            "ingredientes": ["principal": "tt1",
                                            "secondary": "tt2"
                                            ]
                        },
                        {
                            "name": "Ceviche de mero",
                            "origin": "Puno",
                            "price": 50.6,
                            "country": "Italia",
                            "user_ids": "56",
                            "ingredientes": ["principal": "sds1",
                                            "secondary": "sdd2"
                                            ]
                        }
                    ]
        """.data(using: .utf8)
        return json!
        
    }
}
