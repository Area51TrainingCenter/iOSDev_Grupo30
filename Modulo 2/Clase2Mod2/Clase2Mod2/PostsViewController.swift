//
//  PostsViewController.swift
//  Clase2Mod2
//
//  Created by Admin on 5/9/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Alamofire

class PostsViewController: UITableViewController {
    
    var posts: [[String: Any]]?

    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        requestPostsWithAlamofire()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Navigation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "postdetailSegue" {
            return true
        }
        return false
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "postdetailSegue" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let detail = segue.destination as! PostDetailViewController
                detail.post = posts![indexPath.row]
                
            }
  
        }
    }
    
    func requestPostsWithAlamofire() {
        
        Alamofire.request("http://localhost:3000/posts").responseJSON { (response) in
            
            if let json = response.result.value as? [[String: Any]] {
                
                self.posts = json
                self.tableView.reloadData()
                
            }else {
                print(response.error?.localizedDescription)
            }

        }
        
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return posts != nil ? 1 : 0
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath)
        
        let post = posts![indexPath.row]
        
        cell.textLabel?.text = post["title"] as? String
        
        return cell
    }

}
