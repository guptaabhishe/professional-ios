//
//  UITextfeild+SecureToggle.swift
//  Professional-ios
//
//  Created by Abhishek Gupta on 07/10/23.
//

import Foundation
import UIKit

let passwordToggleButton = UIButton(type: .custom)

extension UITextField{
    func enablePasswordToggle(){
        passwordToggleButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        passwordToggleButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        passwordToggleButton.addTarget(self, action: #selector(togglePassword), for: .touchUpInside)
        rightView = passwordToggleButton
        rightViewMode = .always
    }
    @objc func togglePassword(){
        passwordToggleButton.isSelected.toggle()
        isSecureTextEntry.toggle()
        
    }
}
