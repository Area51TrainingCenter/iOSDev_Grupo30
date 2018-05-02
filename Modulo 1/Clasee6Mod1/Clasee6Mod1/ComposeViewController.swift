//
//  ComposeViewController.swift
//  Clasee6Mod1
//
//  Created by Alumno on 4/30/18.
//  Copyright © 2018 Area51 Training Center. All rights reserved.
//

import UIKit

//Paso 1
protocol ComposeViewControllerDelegate {
    func nuevoRegistro(item: Dictionary<String, String>)
}

class ComposeViewController: UITableViewController {

    @IBOutlet weak var dniTextField: UITextField!
    @IBOutlet weak var nombreTextField: UITextField!
    
    var delegate: ComposeViewControllerDelegate? //Paso 2
    
    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func cerrarButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func guardarButton(sender: UIBarButtonItem) {
        
        let registro = ["dni": dniTextField.text!, "nombre": nombreTextField.text!]
        
        //Paso 3
        delegate?.nuevoRegistro(item: registro)

        dismiss(animated: true, completion: nil)

    }
}
