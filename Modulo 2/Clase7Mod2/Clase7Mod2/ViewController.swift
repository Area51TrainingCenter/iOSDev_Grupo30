//
//  ViewController.swift
//  Clase7Mod2
//
//  Created by alumno on 5/21/18.
//  Copyright © 2018 Area51. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: IBAction methods
    @IBAction func login(_ sender: Any) {
        
        /*
         1.- Validar campos.
         2.- Validar formatos.
         3.- API.
         4.- Guardar usuario.
         5.- Cambiar de vista.
 */
        
        guard let app = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = app.persistentContainer.viewContext
        
        if let email = emailTextField.text, let password = passwordTextField.text, email.count > 0, password.count > 0 {
            
            let newUser = User(context: context)
            newUser.email = email
            newUser.password = password
            
            app.saveContext()
        }

    }


}

