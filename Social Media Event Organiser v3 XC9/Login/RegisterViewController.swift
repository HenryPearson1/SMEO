//
//  RegisterViewController.swift
//  Created by Juheb
//  Copyright © 2018 Juheb. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class RegisterViewController: UIViewController {
    
    let validation = Validation()
    let alert = Alert()
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    
    var valid: Bool = false
    var isInput: Bool = false
    let date = Date()
    let calendar = Calendar.current
    var dateString: String = ""
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let day = String(calendar.component(.day, from: date))
        let month = String(calendar.component(.month, from: date))
        let year = String(calendar.component(.year, from: date))
        dateString = "\(day)/\(month)/\(year)"
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func RegisterButton(_ sender: Any) {
        
        if emailField.text == ""
        {
            present(alert.defaultAlert(alertTitle: "Warning", alertMessage: "Please enter email"), animated: true, completion: nil)
            valid = false
            isInput = false
        }
        else if passField.text == ""
        {
            present(alert.defaultAlert(alertTitle: "Warning", alertMessage: "Please enter password"), animated: true, completion: nil)
            valid = false
            isInput = false
        }
        else
        {
            isInput = true
        }
        if isInput == true
        {
            if validation.isValidEmail(emailStr: emailField.text!) == false
            {
                present(alert.defaultAlert(alertTitle: "Warning", alertMessage: "Invalid email \n Please try again"), animated: true, completion: nil)
                valid = false
            }
            else if validation.isValidPass(passStr: passField.text!) == false
            {
                present(alert.defaultAlert(alertTitle: "Warning", alertMessage: "Invalid password \n Password must consist of minimum eight characters, at least one uppercase letter, one lowercase letter and one number"), animated: true, completion: nil)
                valid = false
            }
            else
            {
                valid = true
            }
        }
        
        if valid == true
        {
            Auth.auth().createUser(withEmail: emailField.text!, password: passField.text!)
            { (user, error) in
                if error != nil
                {
                    print(error as Any)
                }
                else
                {
                    print("Registration Success")
                    self.FirebasePush()
                    self.clearTextFields()
                    self.present(self.alert.defaultAlert(alertTitle: "Info", alertMessage: "Registration Success"), animated: true, completion: nil)
                    self.performSegue(withIdentifier: "registerSegue", sender: nil)
                }
            }

            valid = false
        }
        
    }
    
    
    func FirebasePush()
    {
        let ref = Database.database().reference()
        
        let userID = Auth.auth().currentUser!.uid
        let userIDRef = ref.child("Users").child(userID)
        let userIDListRef = ref.child("UserList")
        
        userIDRef.child("email").setValue(self.emailField.text!)
        userIDRef.child("username").setValue(self.usernameField.text!)
        userIDRef.child("bio").setValue("")
        userIDRef.child("ownEvents").setValue("")
        userIDRef.child("eventsGoingTo").setValue("")
        userIDRef.child("dateJoined").setValue(dateString)
        userIDRef.child("userID").setValue(userID)
        userIDListRef.child(userID).setValue(self.usernameField.text)
        
    }
    
    func clearTextFields()
    {
        self.emailField.text = ""
        self.passField.text = ""
    }
    
}

