//
//  LoginViewModel.swift
//  TwitterClient
//
//  Created by Shilpa Joy on 2021-10-20.
//

import Foundation
import UIKit

protocol LoginViewModelDelegate {
    func sendValue(from emailTextField: String?, passwordTextField: String?) -> Bool
}

class LoginViewModel: LoginViewModelDelegate {
   
    // MARK: - Properties
    
    var delegate: LoginViewControllerDelegate?
    var email = "shilpa", password = "123"
    // MARK: - LoginViewModelDelegate
    
    func sendValue(from emailTextField: String?, passwordTextField: String?) -> Bool{
       guard let emailTextField = emailTextField?.lowercased() else { return false }
       guard let passwordTextField = passwordTextField else { return false }
        
        if emailTextField == email && passwordTextField == password {
            delegate?.showLoginStatus(output: "Login Sucessful")
            return true
        } else {
            delegate?.showError(errorMessage: "Try again, incorrect username or password")
            return false
        }
    }
}
