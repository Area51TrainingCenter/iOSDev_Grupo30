//
//  CommentComposeViewController.swift
//  Clase2Mod2
//
//  Created by Admin on 5/9/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Alamofire

class CommentComposeViewController: UITableViewController {
    
    var postId: Int?

    @IBOutlet weak var commentTextField: UITextField!
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
        
        let parameter: [String: Any] = ["body": commentTextField.text!, "postId": postId!]
        
        Alamofire.request("http://localhost:3000/comments", method: .post, parameters: parameter, encoding: JSONEncoding.default).responseJSON { (result) in
            
            DispatchQueue.main.async {
                if let t = result.result.value {
                    print(t)
                    //self.showMessage(message: "Éxito")
                }else {
                    print(result.error?.localizedDescription)
                }
            }
            
        }
        
        //tasks
        dismiss(animated: true) {
            
        }
    }

}
