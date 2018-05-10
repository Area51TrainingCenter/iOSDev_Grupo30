//
//  CenterViewController.swift
//  Clase1Mod2
//
//  Created by Alumno on 5/7/18.
//  Copyright © 2018 Area51 Training Center. All rights reserved.
//

import UIKit

class CenterViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var picture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func tomarFoto(sender: UIButton) {
        setupCamera()
    }
    
    func setupCamera() {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            present(picker, animated: true, completion: nil)
            
        }

    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let photo = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            picture.image = photo
            
        }
        picker.dismiss(animated: true, completion: nil)
        
    }

}
