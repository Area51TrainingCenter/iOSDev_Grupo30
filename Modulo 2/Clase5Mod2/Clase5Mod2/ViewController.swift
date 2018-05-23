//
//  ViewController.swift
//  Clase5Mod2
//
//  Created by Admin on 5/16/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Social

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBAction func shareFacebook(_ sender: Any) {

        
    }
    @IBAction func loginFB(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupFacebookLoginButton()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupFacebookLoginButton() {
        
        let button = FBSDKLoginButton()
        button.delegate = self
        button.center = view.center
        view.addSubview(button)
        
    }
    
    //MARK: FBSDKLoginButtonDelegate methods
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if result.isCancelled {
            print("usuario canceló")
        }else if error != nil {
            print(error.localizedDescription)
        }else {
            print(result.token.tokenString)
        }
        
    }
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }

}

