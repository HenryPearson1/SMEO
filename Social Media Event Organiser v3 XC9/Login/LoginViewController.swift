//
//  LoginViewController.swift
//  Social Media Event Organiser v3 XC9
//
//  Created by ANGRERYPHINE on 20/04/2018.
//  Copyright © 2018 Seena Shafai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    let validation = Validation()
    let alert = Alert()
    var valid: Bool = false
    var isInput: Bool = false
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func SignInAction(_ sender: Any) {
        //Validates inputs and returns errors
        if emailTextField.text == "" { //if the email field is empty return error
            present(alert.defaultAlert(alertTitle: "Warning", alertMessage: "Please enter email"), animated: true, completion: nil)
            valid = false //returns valid to false if it was previously true
            isInput = false //as above
        }
        else if passwordTextField.text == "" { //if password is empty return error
            present(alert.defaultAlert(alertTitle: "Warning", alertMessage: "Please enter password"), animated: true, completion: nil)
            valid = false
            isInput = false
        }
        else{
            isInput = true //only true if there is text present in both fields. Separation given to allow custom error messages
        }
        if isInput == true{
            if validation.isValidEmail(emailStr: emailTextField.text!) == false{
                present(alert.defaultAlert(alertTitle: "Error", alertMessage: "Invalid username or password \n Please try again"), animated: true, completion: nil)
                valid = false
            }
            else if validation.isValidPass(passStr: passwordTextField.text!) == false{
                present(alert.defaultAlert(alertTitle: "Error", alertMessage: "Invalid username or password \n Please try again"), animated: true, completion: nil)
                valid = false
            }
            else{
                valid = true //if inputs pass regex, then the segue can be performed
            }
        }
        
        if valid == true{
            
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
                
                if error != nil {
                    print(error!)
                    self.present(self.alert.defaultAlert(alertTitle: "Error", alertMessage: "Invalid username or password \n Please try again"), animated: true, completion: nil)
                    //output error message in case of failure
                }
                else {
                    print("Login Success")
                    self.performSegue(withIdentifier: "toMainStoryboard", sender: nil)
                    self.valid = false
                }
                
            })
            
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

