//
//  loginHeader.swift
//  Professional-ios
//
//  Created by Abhishek Gupta on 20/08/23.
//

import UIKit


class LogInHeader:UIStackView {
    var loginLabelHeader = UILabel()
    var loginLabelsub = UILabel()
    var loginLabelsub2 = UILabel()
    override init(frame: CGRect) {
        super.init(frame:frame)
        style()
        layout()
    }
    
    private func style(){
        alignment = .center
        loginLabelHeader.text = "Bankey"
        loginLabelHeader.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        loginLabelHeader.textAlignment = .center
        loginLabelHeader.translatesAutoresizingMaskIntoConstraints = false
        loginLabelHeader.numberOfLines = 0
        
        loginLabelsub.text="Your premium resource for all things banking!"
        loginLabelsub.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        loginLabelsub.textAlignment = .center
        loginLabelsub.translatesAutoresizingMaskIntoConstraints = false
        loginLabelsub.numberOfLines=0
        
        loginLabelsub2.translatesAutoresizingMaskIntoConstraints = false
        loginLabelsub2.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        loginLabelsub2.text="thing banking"
        loginLabelsub2.textAlignment = .center
        loginLabelsub2.numberOfLines = 0
    }
    private func layout(){
        
        addArrangedSubview(loginLabelHeader)
        addArrangedSubview(loginLabelsub)
        //addArrangedSubview(loginLabelsub2)
        
        NSLayoutConstraint.activate([
//            loginLabelsub.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
          loginLabelsub.widthAnchor.constraint(equalToConstant: 250)
        ])
        axis = .vertical
        
       
    }
    required init(coder: NSCoder) {
        fatalError("fatal Error")
    }
}
