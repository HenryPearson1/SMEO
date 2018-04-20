//
//  Validation.swift
//  etonchat
//
//  Created by Juheb on 06/03/2018.
//  Copyright © 2018 Juheb. All rights reserved.
//

import Foundation

class Validation { 
    
    //Email Validation
    func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}(.[A-Za-z]{2,64})?" //email name (letter, number, special) + @ + provider name (letter/number) + . + domain name (letter, between 2 and 64 chars) + any additional domains
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailStr)
    }
    
    //Password Validation
    func isValidPass(passStr:String) -> Bool {
        let passRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,}$" //Minimum six characters, at least one uppercase letter, one lowercase letter and one number
        let passTest = NSPredicate(format:"SELF MATCHES %@", passRegEx)
        return passTest.evaluate(with: passStr)
    }
}
