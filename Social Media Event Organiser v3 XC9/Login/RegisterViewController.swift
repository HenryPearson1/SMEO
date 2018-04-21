//
//  RegisterViewController.swift
//  Social Media Event Organiser v3 XC9
//
//  Created by Seena Shafai on 20/04/2018.
//  Copyright © 2018 Seena Shafai. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signUpAction(_ sender: Any)
    {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil{
                print(error as Any)
                self.failureAlert()
                print("firebase validation error")
            }
            else
            {
                print("success")
                self.successAlert()
            }
        }

    }
    
    func successAlert() {
        
        let alertController = UIAlertController(title: "Alert", message: "Registration Successful", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "Continue to Sign In", style: .default) { (action:UIAlertAction) in
            self.navigationController?.popToRootViewController(animated: true);
        }
        
        alertController.addAction(action1)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func failureAlert() {
        
        let alertController = UIAlertController(title: "Alert", message: "Registration Failed\nPlease check your email and password", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "Cancel", style: .default) { (action:UIAlertAction) in
            print("failed");
        }
        
        alertController.addAction(action1)
        self.present(alertController, animated: true, completion: nil)
        
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
