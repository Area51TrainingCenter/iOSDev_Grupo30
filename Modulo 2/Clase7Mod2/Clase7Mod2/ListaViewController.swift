//
//  ListaViewController.swift
//  Clase7Mod2
//
//  Created by alumno on 5/21/18.
//  Copyright © 2018 Area51. All rights reserved.
//

import UIKit

class ListaViewController: UITableViewController {
    
    var cars: [Car]?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        requestCars()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func requestCars() {
        
        if let user = User.current(), let cars = user.cars, cars.count > 0 {
            
            self.cars = cars.allObjects as? [Car]
            tableView.reloadData()
            
        }
        
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return cars == nil ? 0 : 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars!.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath)
        
        let car = cars![indexPath.row]
        
        cell.textLabel?.text = car.brand

        return cell
    }

}
