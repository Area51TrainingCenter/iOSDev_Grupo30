//
//  ModalViewController.swift
//  Clase2Mod1
//
//  Created by Alumno on 4/20/18.
//  Copyright © 2018 Area51 Training Center. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    @IBAction func closeButton(_ sender: UIBarButtonItem) {
        print("Close")
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func actionButton() {
        print("action")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
