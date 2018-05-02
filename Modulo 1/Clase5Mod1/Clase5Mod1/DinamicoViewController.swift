//
//  DinamicoViewController.swift
//  Clase5Mod1
//
//  Created by Alumno on 4/27/18.
//  Copyright © 2018 Area51 Training Center. All rights reserved.
//

import UIKit

class DinamicoViewController: UITableViewController {
    
    var numeroDeFilas: Int = 5

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numeroDeFilas
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath) as! SubclassCell
        cell.nombreLabel.text = "\(indexPath.row)"
        cell.interruptorSwitch.setOn(false, animated: true)
        return cell*/
        
        let ac = tableView.dequeueReusableCell(withIdentifier: "autolayoutCell", for: indexPath) as! AutolayoutCell
        
        ac.tituloLabel.text = "Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vivamus posuere ante vitae odio consequat eleifend"
        ac.descripcionLabel.text = "Aliquam cursus scelerisque commodo. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras molestie nunc eget libero sodales dapibus. Aliquam sed tellus vitae ligula fringilla eleifend sit amet vitae nulla. Fusce at nunc at dui lobortis semper"
        
        return ac
        
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        numeroDeFilas = numeroDeFilas - 1
        tableView.reloadData()
        
    }

}
