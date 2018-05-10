//
//  ManagerViewController.swift
//  Clase1Mod2
//
//  Created by Alumno on 5/7/18.
//  Copyright © 2018 Area51 Training Center. All rights reserved.
//

import UIKit

class ManagerViewController: JASidePanelController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func awakeFromNib() {
        
        leftPanel = storyboard?.instantiateViewController(withIdentifier: "MenuViewController")
        
        centerPanel = storyboard?.instantiateViewController(withIdentifier: "CenterViewController")
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
