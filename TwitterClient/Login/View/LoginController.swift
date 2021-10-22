//
//  LoginViewController.swift
//  TwitterClient
//
//  Created by Shilpa Joy on 2021-10-20.
//

import UIKit

protocol LoginViewControllerDelegate {
    func showLoginStatus(output: String)
    func showError(errorMessage: String)
}

class LoginController: UIViewController {
   
    // MARK: - Properties
    
    var loginViewModel = LoginViewModel()
    private let logoImageview: UIImageView = {
        let logoImage = UIImageView()
        logoImage.contentMode = .scaleAspectFit
        logoImage.clipsToBounds = true
        logoImage.image = UIImage(named: "TwitterLogo")
        return logoImage
    }()

    private lazy var emailContainerView: UIView = {
        let image = UIImage(named: "email")
        let view = Utilities.inputContainerview(withImage: image!, textField: emailTextField)
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        let image = UIImage(named: "password")
        let view = Utilities.inputContainerview(withImage: image!, textField: passwordTextField)
        return view
    }()
    
    private let emailTextField: UITextField = {
        let tf = Utilities.textField(withPlaceHolder: "Email")
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = Utilities.textField(withPlaceHolder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginViewModel.delegate = self
        configureUI()
    }
    
    // MARK: - Selectors
  
    @objc func loginButtonTapped() {
        loginViewModel.sendValue(from: emailTextField.text, passwordTextField: passwordTextField.text)
    }
        
    // MARK: - Helpers

    func configureUI() {
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.barStyle = .black
        
        view.addSubview(logoImageview)
        logoImageview.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoImageview.setDimensions(width: 150, height: 150)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,
                                                   passwordContainerView, loginButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fill
        
        view.addSubview(stack)
        stack.anchor(top: logoImageview.bottomAnchor, left: view.leftAnchor,
                     right: view.rightAnchor, paddingLeft: 32, paddingRight: 32)
        
    }
}
extension LoginController: LoginViewControllerDelegate {
   
    func showLoginStatus(output: String) {
        print(output)
        emailTextField.text = ""
        passwordTextField.text = ""
        let controller = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func showError(errorMessage: String) {
        let alert = UIAlertController(title: "Invalid Username or Password", message: "Username is shilpa@mail.com and password is 1234", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}


