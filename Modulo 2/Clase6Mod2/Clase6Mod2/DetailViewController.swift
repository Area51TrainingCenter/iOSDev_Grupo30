//
//  DetailViewController.swift
//  Clase6Mod2
//
//  Created by alumno on 18/05/18.
//  Copyright © 2018 Area51. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titulo: UILabel!
    
    var text: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        titulo.text = text
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
