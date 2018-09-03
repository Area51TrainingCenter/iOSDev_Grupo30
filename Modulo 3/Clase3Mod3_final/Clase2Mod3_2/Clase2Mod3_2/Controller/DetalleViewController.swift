//
//  DetalleViewController.swift
//  Clase2Mod3_2
//
//  Created by Area51 on 8/29/18.
//  Copyright © 2018 Area51. All rights reserved.
//

import UIKit
import CoreData

protocol DetalleViewControllerDelegate: class {
    func detalle(_ nuevoItem: Item)
}

class DetalleViewController: UITableViewController {
    
    var nuevoItem: Item!
    private var tasks: [Task]!
    var managedContext: NSManagedObjectContext!
    
    weak var delegate: DetalleViewControllerDelegate?

    //MARK: Lifecycle method
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveItem(_ sender: UIBarButtonItem) {
        
        /*
         1.- Validar la caja de texto.
         2.- tasks > 0
         */
        
        guard let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) else { return }
        guard let textField = cell.viewWithTag(100) as? UITextField else { return }
        guard let texto = textField.text, texto.count > 0 else { return }
        
        guard nuevoItem.tasks!.count > 0 else { return }
        
        nuevoItem.name = texto
        
        delegate?.detalle(nuevoItem)
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func addTask(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Nuevo task", message: "Inserte nombre", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Nombre de tarea"
        }
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Agregar", style: .default, handler: { (_) in
            
            //task
            //1.- Crear task object
            //2.- Actualizar tableview
            
            let newTask = Task(context: self.managedContext)
            newTask.name = alert.textFields?.first?.text
            self.nuevoItem.addToTasks(newTask)
            self.tableView.reloadData()
            
            //self.tableView.reloadSections(IndexSet(integer: 1), with: .fade)
            
        }))
        

        present(alert, animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        guard let tasks = nuevoItem.tasks, tasks.allObjects.count > 0 else { return 1 }
        return 2

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : nuevoItem.tasks!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            
            let f = tableView.dequeueReusableCell(withIdentifier: "formCell", for: indexPath)
            let textfield = f.viewWithTag(100) as? UITextField
            textfield?.text = nuevoItem.name
            return f
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath)
            
            let task = (nuevoItem.tasks!.allObjects as! [Task]).sorted(by: { $0.name! < $1.name! }) //nuevoItem.tasks!.allObjects as! [Task]
            cell.textLabel?.text = task[indexPath.row].name
            
            return cell
        }

    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == 0 ? false : true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let task = (nuevoItem.tasks!.allObjects as! [Task]).sorted(by: { $0.name! < $1.name! })[indexPath.row]
        
        managedContext.delete(task)
        
        do {
            try managedContext.save()
            tableView.reloadData()
        }catch {
            
        }

    }

}
