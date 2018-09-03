//
//  ListaViewController.swift
//  Clase2Mod3_2
//
//  Created by Area51 on 8/29/18.
//  Copyright © 2018 Area51. All rights reserved.
//

import UIKit
import CoreData

class ListaViewController: UITableViewController {
    
    var items: [Item] = []
    
    var managedContext: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        obtenerItems()
 
    }
    
    func obtenerItems() {
        
        let fetchRequest: NSFetchRequest<Item> =  Item.fetchRequest()
        
        do {
           let result = try managedContext.fetch(fetchRequest)
            items = result
            tableView.reloadData()
            
        }catch let error {
            print(error.localizedDescription)
        }

    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailSegue" {
            
            let detail = segue.destination as! DetalleViewController
            detail.delegate = self
            detail.managedContext = managedContext
            detail.nuevoItem = Item(context: managedContext)
            
        }else if segue.identifier == "modificarSegue" {
            let item = sender as? Item
            
            let detail = segue.destination as! DetalleViewController
            detail.nuevoItem = item
            detail.managedContext = managedContext
            
        }
        
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return items.count > 0 ? 1 : 0
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath)
        
        let item = items[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "\(item.tasks!.count)"
        
        return cell
        
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let itemSeleccionado = items[indexPath.row]
        managedContext.delete(itemSeleccionado)
        
        do {
            try managedContext.save()
            obtenerItems()
            tableView.reloadData()
        }catch {
            print(error.localizedDescription)
        }
        
    }
    
    //MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "modificarSegue", sender: items[indexPath.row])
    }

}

extension ListaViewController: DetalleViewControllerDelegate {
    
    func detalle(_ nuevoItem: Item) {
        
        items.append(nuevoItem)
        
        do {
            try managedContext.save()
            tableView.reloadData()
        }catch {
            print(error.localizedDescription)
        }

    }
    
}
