//
//  MainViewController.swift
//  Professional-ios
//
//  Created by Abhishek Gupta on 02/09/23.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
         setUp()
        // Do any additional setup after loading the view.
    }
    
    private func setUp(){
          let v1 = view1()
          let v2 = view2()
          let v3 = view3()
        v1.setTabImageAndTitle(imageName: "list.dash.header.rectangle", title: "Summary")
        v2.setTabImageAndTitle(imageName: "arrow.left.arrow.right", title: "Move Money")
        v3.setTabImageAndTitle(imageName: "ellipsis.circle", title: "More")
        
        let nv1 = UINavigationController(rootViewController: v1)
        let nv2 = UINavigationController(rootViewController: v2)
        let nv3 = UINavigationController(rootViewController: v3)
        
        self.viewControllers = [nv1,nv2,nv3]
        self.tabBar.isTranslucent = false
        
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

class view1:UIViewController{
    override func viewDidLoad() {
        view.backgroundColor = .systemRed
    }
}

class view2:UIViewController{
    override func viewDidLoad() {
        view.backgroundColor = .systemBrown
    }
}

class view3:UIViewController{
    override func viewDidLoad() {
        view.backgroundColor = .systemGray
    }
}

