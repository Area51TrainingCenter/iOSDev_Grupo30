//
//  ListaViewController.swift
//  Clasee6Mod1
//
//  Created by Alumno on 4/30/18.
//  Copyright © 2018 Area51 Training Center. All rights reserved.
//

import UIKit

class ListaViewController: UITableViewController, ComposeViewControllerDelegate { //Paso 1
    
    var people: Array<Dictionary<String, String>>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        people = []
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Paso 2
    func nuevoRegistro(item: Dictionary<String, String>) {
        
        people.append(item)
        tableView.reloadData()
    }

    //MARK: Navigation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addSegue" {
            
            let nav = segue.destination as! UINavigationController
            
            let detail = nav.topViewController as! ComposeViewController
            detail.delegate = self //Paso 3
            
        }else {
            
            let row = tableView.indexPathForSelectedRow!.row
            
            let detail = segue.destination as! DetailViewController
            detail.personSelected = people[row]
            
        }
 
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return people.count == 0 ? 0 : 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let person = people[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath)
        cell.textLabel?.text = person["nombre"]

        return cell
    }
}
