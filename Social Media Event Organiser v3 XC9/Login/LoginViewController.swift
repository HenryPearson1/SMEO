//
//  LoginViewController.swift
//  Social Media Event Organiser v3 XC9
//
//  Created by Seena Shafai on 20/04/2018.
//  Copyright © 2018 Seena Shafai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func SignInAction(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            if error != nil
            {
                print(error!)
            }
            else{
                print("login successful")
                self.performSegue(withIdentifier: "toMainStoryboard", sender: self)
            }
        }
    }
    
    @IBAction func RegisterAction(_ sender: Any)
    {
        print("To Register View")
        performSegue(withIdentifier: "toRegisterView", sender: self)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
