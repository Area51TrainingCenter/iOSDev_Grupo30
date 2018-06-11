//
//  Request.swift
//  Clase3Mod3
//
//  Created by alumno on 5/30/18.
//  Copyright © 2018 alumno. All rights reserved.
//

import Foundation

class Request {
    
    static func items(completion: ([Plato]?, Error?) -> Void) {
        
        /*
         Lógica:
         1.- Local
         2.- Store
         3.- Networking
 */
        let data = Local.items()
        let decoder = JSONDecoder()

        do {
            let platos = try decoder.decode([Plato].self, from: data)
            
            completion(platos, nil)

        }catch let error {
            completion(nil, error)
        }
        
    }

}
