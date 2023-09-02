//
//  OnBoardingViewController.swift
//  Professional-ios
//
//  Created by Abhishek Gupta on 25/08/23.
//

import UIKit

class OnBoardingViewController: UIViewController {
    var image = UIImageView()
    var text = UILabel()
    var stack = UIStackView()
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    
    init(imageName:String , text:String){
        super.init(nibName: nil, bundle: nil)
        self.image.image = UIImage(named: imageName)
        self.text.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
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
        text.font = .preferredFont(forTextStyle: .title3)
        
       // view.backgroundColor = .systemRed
    }
    private func layout(){
        image.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stack)
        stack.addArrangedSubview(image)
        stack.addArrangedSubview(text)
        
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

}
