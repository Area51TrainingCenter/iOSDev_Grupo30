//
//  ViewController.swift
//  Clase1Mod2
//
//  Created by Alumno on 5/7/18.
//  Copyright © 2018 Area51 Training Center. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate { //Paso 1
    
    var manager: CLLocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupLocationManager() {
        
        manager = CLLocationManager()
        manager?.delegate = self //Paso 2
        
        manager?.requestWhenInUseAuthorization()
        manager?.startUpdatingLocation()

    }
    
    //MARK: CLLocationManagerDelegate methods
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.last)
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(status.rawValue)
    }

}

