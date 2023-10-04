//
//  ViewController+Utils.swift
//  Professional-ios
//
//  Created by Abhishek Gupta on 02/09/23.
//

import UIKit

extension UIViewController{
    func setStatusBar() {
        let statusBarSize = UIApplication.shared.statusBarFrame.size // deprecated but OK
        let frame = CGRect(origin: .zero, size: statusBarSize)
        let statusbarView = UIView(frame: frame)

        statusbarView.backgroundColor = appColor
        view.addSubview(statusbarView)
    }
    func setTabImageAndTitle(imageName:String , title:String){
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName,withConfiguration: configuration)
        self.tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
