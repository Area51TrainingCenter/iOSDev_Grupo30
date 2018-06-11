//
//  API.swift
//  Clase1Mod3
//
//  Created by Admin on 25/05/18.
//  Copyright © 2018 area51. All rights reserved.
//

import Foundation

class API {
    
    static func post(url: String, method: String, parameters: [String: Any]?, completion: (Any?, Error?) -> Void ){

        let session = URLSession.shared
        
        let url = URL(string: url)!
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        if let _ = parameters {
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters!, options: .prettyPrinted)
            }catch let error {
                print(error.localizedDescription)
            }
            
        }
        
        
        session.dataTask(with: request) { (data, response, error) in
            
            if let _ = error  {
                print(error!.localizedDescription)
            }else {
            
            }
            
        }.resume()
        
        
    }
    
}
