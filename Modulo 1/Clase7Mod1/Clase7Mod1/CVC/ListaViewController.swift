//
//  ListaViewController.swift
//  Clase7Mod1
//
//  Created by Alumno on 5/2/18.
//  Copyright © 2018 Area51 Training Center. All rights reserved.
//

import UIKit

class ListaViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.size.width/3)-10, height: 100)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Navigation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let index =
            
            collectionView?.indexPathsForSelectedItems?.first {
            
            let detail = segue.destination as! DetailViewController
            detail.rowSelected = index.row+1
            
        }

    }

    //MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testCell", for: indexPath) as! NumberCell
        cell.titulo.text = "\(indexPath.row + 1)"
    
        return cell
    }

}
