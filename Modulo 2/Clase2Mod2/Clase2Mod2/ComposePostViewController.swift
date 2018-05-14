//
//  ComposePostViewController.swift
//  Clase2Mod2
//
//  Created by Admin on 5/9/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Alamofire

class ComposePostViewController: UITableViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    
    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK: IBAction methods
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func doneButton(_ sender: Any) {
        
        let parameter = ["title": titleTextField.text!, "author": authorTextField.text!]
        
        Alamofire.request("http://localhost:3000/posts", method: .post, parameters: parameter, encoding: JSONEncoding.default).responseJSON { (result) in
            
            DispatchQueue.main.async {
                if let _ = result.result.value {
                    self.showMessage(message: "Éxito")
                }else {
                    print(result.error?.localizedDescription)
                }
            }

        }
        
    }
    
    func showMessage(message: String) {
        
        let alert = UIAlertController(title: "Resultado", message: message, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel) { (_) in
            self.dismiss(animated: true, completion: {
                
            })
        }
        
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
 
    }
}
