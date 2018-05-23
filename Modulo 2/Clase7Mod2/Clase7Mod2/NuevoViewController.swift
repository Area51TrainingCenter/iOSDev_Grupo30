//
//  NuevoViewController.swift
//  Clase7Mod2
//
//  Created by alumno on 5/21/18.
//  Copyright © 2018 Area51. All rights reserved.
//

import UIKit

class NuevoViewController: UIViewController {

    
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addButton(_ sender: Any) {
        
        guard let app = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = app.persistentContainer.viewContext
        
        let newCar = Car(context: context)
        newCar.brand = brandTextField.text
        newCar.model = modelTextField.text
        
        if let user = User.current() {
            user.addToCars(newCar)
        }
        app.saveContext()
        
        dismiss(animated: true, completion: nil)

    }
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
