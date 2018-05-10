//
//  ManagerViewController.swift
//  Clase8Mod1
//
//  Created by Alumno on 5/4/18.
//  Copyright © 2018 Area51 Training Center. All rights reserved.
//

import UIKit

class ManagerViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource {//Paso 1
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var numeroDeFilas: Int = 0
    
    //MARK: Lifecycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout

        layout.itemSize = CGSize(width: (UIScreen.main.bounds.size.width/4)-10, height: 100)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: UITableViewDataSource methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numeroDeFilas
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath)
        return cell
        
    }
    
    //MARK: UICollectionViewDataSource methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testCell", for: indexPath)
        return cell
        
    }
    
    //MARK: UICollectionViewDelegate methods
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        numeroDeFilas = indexPath.row+1
        tableView.reloadData()
    }

}
