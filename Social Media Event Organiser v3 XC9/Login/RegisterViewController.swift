//
//  RegisterViewController.swift
//  Created by Juheb
//  Copyright © 2018 Juheb. All rights reserved.
//

import UIKit
import Firebase



class RegisterViewController: UIViewController {
    
    let validation = Validation()
    let alert = Alert()
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    var valid: Bool = false
    var isInput: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func RegisterButton(_ sender: Any) {
        
        if emailField.text == "" {
            present(alert.defaultAlert(alertTitle: "Warning", alertMessage: "Please enter email"), animated: true, completion: nil)
            valid = false
            isInput = false
        }
        else if passField.text == "" {
            present(alert.defaultAlert(alertTitle: "Warning", alertMessage: "Please enter password"), animated: true, completion: nil)
            valid = false
            isInput = false
        }
        else{
            isInput = true
        }
        if isInput == true{
            if validation.isValidEmail(emailStr: emailField.text!) == false{
                present(alert.defaultAlert(alertTitle: "Warning", alertMessage: "Invalid email \n Please try again"), animated: true, completion: nil)
                valid = false
            }
            else if validation.isValidPass(passStr: passField.text!) == false{
                present(alert.defaultAlert(alertTitle: "Warning", alertMessage: "Invalid password \n Password must consist of minimum six characters, at least one uppercase letter, one lowercase letter and one number"), animated: true, completion: nil)
                valid = false
            }
            else{
                valid = true
            }
        }
        
        if valid == true{
            Auth.auth().createUser(withEmail: emailField.text!, password: passField.text!) { (user, error) in
                if error != nil{
                    print(error as Any)
                }
                else{
                    print("Registration Success")
                    
                }
            }
            // performSegue(withIdentifier: "", sender: nil)
            valid = false
        }
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

