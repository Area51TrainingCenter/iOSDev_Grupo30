//
//  PostDetailViewController.swift
//  Clase2Mod2
//
//  Created by Admin on 5/9/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Alamofire

class PostDetailViewController: UITableViewController {
    
    var post: [String: Any]?
    var comments: [[String: Any]]?

    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRightButton()
    }
    override func viewWillAppear(_ animated: Bool) {
        requestComments()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateComment(at indexPath: IndexPath) {
        
        let comment = comments![indexPath.row]
        
        let url = "http://localhost:3000/comments/\(comment["id"] as! Int)"
        
        let parameter: [String: Any] = ["body": "Hola iOS", "postId": post!["id"] as! Int]
        
        Alamofire.request(url, method: .put, parameters: parameter, encoding: JSONEncoding.default).responseJSON { (response) in
            
            if response.result.isSuccess {
  
            }else {
                print(response.error?.localizedDescription)
            }
            
        }
        
    }
    func deleteComment(at indexPath: IndexPath) {
        
        let comment = comments![indexPath.row]
        let commentId = comment["id"] as! Int
        
        let url = "http://localhost:3000/comments/\(commentId)"
        
        Alamofire.request(url, method: .delete, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            
            if response.result.isSuccess {
                
                self.comments!.remove(at: indexPath.row)
                self.tableView.reloadData()
                
            }else {
                print(response.error?.localizedDescription)
            }
            
        }

    }
    func requestComments() {
        
        let url = "http://localhost:3000/posts/\(post!["id"] as! Int)/comments"
        
        Alamofire.request(url).responseJSON { (response) in
            
            if let json = response.result.value as? [[String: Any]] {
                
                self.comments = json
                self.tableView.reloadData()
                
            }else {
                print(response.error?.localizedDescription)
            }
            
        }
        
        
    }
    func setupRightButton() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addComment))
        
    }
    @objc func addComment() {
        performSegue(withIdentifier: "newcommentSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "newcommentSegue" {
            let nav = segue.destination as! UINavigationController
            let detail = nav.topViewController as! CommentComposeViewController
            detail.postId = post!["id"] as? Int
            
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return comments != nil ? (comments!.count > 0 ? 2 : 1) : 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : comments!.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0: // post
            let postCell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
            
            postCell.textLabel?.text = post!["author"] as? String
            postCell.detailTextLabel?.text = post!["title"] as? String
            return postCell
        default: // comments
            
            let commentCell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
            
            let comment = comments![indexPath.row]
            commentCell.textLabel?.text = comment["body"] as? String
            return commentCell
            
        }

    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        deleteComment(at: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Post" : "Comments"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        updateComment(at: indexPath)
    }

}
