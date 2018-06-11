//
//  ListViewController.swift
//  Clase1Mod3
//
//  Created by Admin on 25/05/18.
//  Copyright © 2018 area51. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    var posts: [Post]?

    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewcell()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    func registerTableViewcell() {
        
        let nib = UINib(nibName: "ItemCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "itemCell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "newpostSegue" {
            let nav = segue.destination as! UINavigationController
            let _ = nav.topViewController as! NewViewController
            
        }else {
            //let detail = segue.destination as! DetailViewController
            //detail.postSelected = Post(uid: 0, author: "", title: "")
            
        }
        
        
    }

    // MARK: UITableViewDataSource methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        guard let _ = posts else { return 0 }
        return 1
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let p = posts else { return 0 }
        return p.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        return cell
        
    }
    
}
