//
//  OnBoardingViewController.swift
//  Professional-ios
//
//  Created by Abhishek Gupta on 25/08/23.
//

import UIKit

protocol LogoutDelegate: AnyObject {
    func didLogout()
}

class DummyViewController: UIViewController {
    var text = UILabel()
    var button = UIButton()
    var stack = UIStackView()
    
    weak var delegate:LogoutDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         style()
         layout()
        // Do any additional setup after loading the view.
    }
    
    private func style(){
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .center
        
        text.numberOfLines = 0
        text.textAlignment = .center
        text.font = .preferredFont(forTextStyle: .title2)
        text.text = "Welcome"
        
        button.setTitle("Logout", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didLogoutTapped), for: .touchUpInside)
        button.titleLabel?.font = .preferredFont(forTextStyle: .callout)
        button.configuration = .filled()
    }
    private func layout(){
        text.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stack)
        stack.addArrangedSubview(text)
        stack.addArrangedSubview(button)

        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            text.widthAnchor.constraint(equalToConstant: 300)
        ])
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func didLogoutTapped(_ sender:UIButton){
        delegate?.didLogout()
    }

}

