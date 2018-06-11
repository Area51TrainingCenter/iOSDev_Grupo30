//
//  ViewController.swift
//  Clase3Mod3
//
//  Created by alumno on 5/30/18.
//  Copyright © 2018 alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var platos: [Plato]?

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        requestItems()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func requestItems() {
        
        Request.items { (platos, error) in
            
            DispatchQueue.main.async {
                
                if let result = platos, result.count > 0 {
                    self.platos = result
                    self.collectionView.reloadData()
                }
                
            }

        }

    }

}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return platos == nil ? 0 : 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return platos!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testCell", for: indexPath)
        return cell
    }
    
}

