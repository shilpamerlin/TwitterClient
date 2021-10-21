//
//  LoginViewModel.swift
//  TwitterClient
//
//  Created by Shilpa Joy on 2021-10-20.
//

import Foundation
import UIKit

protocol LoginViewModelDelegate {
    func sendValue(from emailTextField: String?, passwordTextField: String?)
}

class LoginViewModel: LoginViewModelDelegate {
   
    // MARK: - Properties
    
    var delegate: LoginViewControllerDelegate?
    var email = "shilpa", password = "123"
    // MARK: - LoginViewModelDelegate
    
    func sendValue(from emailTextField: String?, passwordTextField: String?) {
        guard let emailTextField = emailTextField?.lowercased() else { return }
        guard let passwordTextField = passwordTextField else { return }
        if emailTextField == email && passwordTextField == password {
            delegate?.showLoginStatus(output: "Login Sucessful")
        } else {
            delegate?.showError(errorMessage: "Try again, incorrect username or password")
        }
    }
}
