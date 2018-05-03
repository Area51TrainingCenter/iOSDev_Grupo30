//
//  DetailViewController.swift
//  Clase7Mod1
//
//  Created by Alumno on 5/2/18.
//  Copyright © 2018 Area51 Training Center. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var numberLabel: UILabel!
    var rowSelected: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = "\(rowSelected)"
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
