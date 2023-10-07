//
//  LoginView.swift
//  Professional-ios
//
//  Created by Abhishek Gupta on 19/08/23.
//
import UIKit

class LoginView:UIView {
    
    let stackView = UIStackView()
    let userNameTextFeild = UITextField()
    let passwordTextFeild = UITextField()
    let dividerView = UIView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView{
    func style(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        
        userNameTextFeild.translatesAutoresizingMaskIntoConstraints = false
        userNameTextFeild.placeholder = "Username"
        userNameTextFeild.delegate = self
        
        passwordTextFeild.placeholder = "Password"
        passwordTextFeild.delegate = self
        passwordTextFeild.isSecureTextEntry = true
        passwordTextFeild.enablePasswordToggle()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill
        
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    
    func layout(){
        stackView.addArrangedSubview(userNameTextFeild)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextFeild)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
            dividerView.heightAnchor.constraint(equalToConstant: 1)
            
        ])
    }
}

extension LoginView:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameTextFeild.endEditing(true)
        passwordTextFeild.endEditing(true)
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
       return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
