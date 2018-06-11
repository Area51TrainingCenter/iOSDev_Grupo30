//
//  NewViewController.swift
//  Clase1Mod3
//
//  Created by Admin on 25/05/18.
//  Copyright © 2018 area51. All rights reserved.
//

import UIKit

class NewViewController: UITableViewController {
    
    var postSelected: Post?

    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewcell()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: IBAction methods
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func doneButton(_ sender: Any) {
    
        guard let cell1 = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? FormularioCell else { return }

        guard let cell2 = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? FormularioCell else {
            
            //Se entiende que es un comentario
            
            if let comment = cell1.valorTextField.text, comment.count > 0 {
                
            }
            return
            
        }
        
        if let author = cell1.valorTextField.text, let titulo = cell2.valorTextField.text , author.count > 0, titulo.count > 0 {
            createPost(titulo: titulo, author: author)

        }

    }
    /*
    func createPost(titulo: String, author: String) {
        let post = Post(uid: nil, author: author, title: titulo)
    }*/
    func createPost(titulo: String, author: String) {
        
        API.post(url: "http://localhost:3000/posts", method: "POST", parameters: ["title": titulo, "author": author]) { (response, error) in
            
            
            
        }
        
        /*
        let parameters = ["title": titulo, "author": author]
        let session = URLSession.shared
        
        let url = URL(string: "http://localhost:3000/posts")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        }catch let error {
            print(error.localizedDescription)
        }

        session.dataTask(with: request) { (data, response, error) in
            
            if let _ = error  {
                print(error!.localizedDescription)
            }else {
                self.dismiss(animated: true, completion: nil)
            }

        }.resume()*/
        
    }
    
    func registerTableViewcell() {
        
        let nib = UINib(nibName: "FormularioCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "formularioCell")
    }
    
    // MARK: UITableViewDataSource methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postSelected == nil ? 2 : 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "formularioCell", for: indexPath) as! FormularioCell
        
        switch indexPath.row {
        case 0:
            
            if let _ = postSelected {
                cell.tituloLabel.text = "Comentario"
                cell.valorTextField.placeholder = "Ingresar"
            }else {
                cell.tituloLabel.text = "Autor"
                cell.valorTextField.placeholder = "Nombre"
            }
        default:
            cell.tituloLabel.text = "Título"
            cell.valorTextField.placeholder = "Nombre"
            
        }

        return cell
        
    }

}
