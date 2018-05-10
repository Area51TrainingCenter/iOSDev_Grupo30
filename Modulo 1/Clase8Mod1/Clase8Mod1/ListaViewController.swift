//
//  ListaViewController.swift
//  Clase8Mod1
//
//  Created by Alumno on 5/4/18.
//  Copyright © 2018 Area51 Training Center. All rights reserved.
//

import UIKit

class ListaViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
    }

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 20
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testCell", for: indexPath)

        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerView", for: indexPath) as! HeaderReusableView
            headerView.tituloLabel.text = "\(indexPath.section)"
            headerView.estadoSwitch.isOn = false
            headerView.estadoSwitch.tag = indexPath.section
            headerView.estadoSwitch.addTarget(self, action: #selector(switchDidSelected(sender:)), for: .valueChanged)
            return headerView
        }else {
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footerView", for: indexPath)
            return footerView
        }

    }
    
    //MARK: UICollectionViewDelegateFlowLayout method
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: 100)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        
        return CGSize(width: UIScreen.main.bounds.size.width, height: 100)
    }
    
    @objc func switchDidSelected(sender: UISwitch) {
        print("acción: \(sender.isOn) - Tag: \(sender.tag)")
        
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
}
