//
//  LoginManagerViewController.swift
//  Clase7Mod1
//
//  Created by Alumno on 5/2/18.
//  Copyright © 2018 Area51 Training Center. All rights reserved.
//

import UIKit

class LoginManagerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loginButton() {
        
        
        /*
        let viewController = UIStoryboard(name: "App", bundle: nil).instantiateInitialViewController()*/
        
        let app = UIApplication.shared.delegate as! AppDelegate
        app.presentarApp()
        
        //storyboard?.instantiateInitialViewController()
        
        
    }

}
