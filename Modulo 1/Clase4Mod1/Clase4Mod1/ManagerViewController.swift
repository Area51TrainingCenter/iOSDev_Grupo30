//
//  ManagerViewController.swift
//  Clase4Mod1
//
//  Created by Alumno on 4/25/18.
//  Copyright © 2018 Area51 Training Center. All rights reserved.
//

import UIKit

class ManagerViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return section == 0 ? 1 : 5

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //print("\(indexPath.section) - \(indexPath.row)")
        
        switch indexPath.section {
        case 0:
            let hcell = tableView.dequeueReusableCell(withIdentifier: "subtitleCell", for: indexPath)
            hcell.textLabel?.text = "Area51 Training Center"
            hcell.detailTextLabel?.text = "iOS"
            hcell.imageView?.image = UIImage(named: "a")
            
            return hcell
        case 1:
            let ccc = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath)
            return ccc
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
            return cell
            
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Hola" : nil
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        <#code#>
    }
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return section == 0 ? "Esto es un footer" : nil
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        print("\(indexPath.section) \(indexPath.row)")
        
    }
    
}
