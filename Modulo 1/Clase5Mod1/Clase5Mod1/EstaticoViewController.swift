//
//  EstaticoViewController.swift
//  Clase5Mod1
//
//  Created by Alumno on 4/27/18.
//  Copyright © 2018 Area51 Training Center. All rights reserved.
//

import UIKit

class EstaticoViewController: UITableViewController {

    @IBOutlet weak var nombreLabel: UILabel!
    
    //MARK: Lifecycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nombreLabel.text = "Area 51"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
