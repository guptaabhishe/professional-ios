//
//  ViewController.swift
//  Professional-ios
//
//  Created by Abhishek Gupta on 19/08/23.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}


class LoginViewController: UIViewController {
   
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel  =  UILabel()
    let loginHeader = LogInHeader()
    weak var delegate:LoginViewControllerDelegate?
    var username:String? {
        return loginView.userNameTextFeild.text;
    }
    
    var password:String?{
        return loginView.passwordTextFeild.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        // Do any additional setup after loading the view.
    }
   
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
    }
}

extension LoginViewController{
    private func style(){
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.text = "A Sample Error!"
        
        loginHeader.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        view.addSubview(loginHeader)
        
        NSLayoutConstraint.activate([
            
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: loginHeader.bottomAnchor, multiplier: 12),
          
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            
            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 1),
            
            loginHeader.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            loginHeader.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            
        ])
        
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
            
        ])
    }
}

extension LoginViewController{
    @objc func signInTapped(){
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login(){
        guard let username = username , let password = password else{
            assertionFailure("username/password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage:"Username/Password can not be empty")
        }
        
        if username=="Kevin" && password=="Welcome" {
            signInButton.configuration?.showsActivityIndicator = true
            errorMessageLabel.isHidden = true
            delegate?.didLogin()
            return
        }else{
            configureView(withMessage: "Incorrect Username/Password")
        }
        signInButton.configuration?.showsActivityIndicator = false
        
    }
    
    private func configureView(withMessage message:String){
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
    
}

