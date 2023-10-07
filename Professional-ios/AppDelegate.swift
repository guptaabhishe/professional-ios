//
//  AppDelegate.swift
//  Professional-ios
//
//  Created by Abhishek Gupta on 19/08/23.
//

import UIKit
let appColor:UIColor = .systemTeal
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window:UIWindow?
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    let mainViewController = MainViewController()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        registerForNotifications()
        displayLogin()
        
        return true
    }
    
    private func registerForNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(didLogout), name: .logout, object: nil)
    }
}


extension AppDelegate:LoginViewControllerDelegate {
    
     
    func displayLogin(){
        mainViewController.setStatusBar()
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundColor = appColor
        window?.rootViewController = loginViewController
    }
    
    
    func didLogin() {
        if LocalState.hasOnboarded {
            setViewController(for: mainViewController)
        }else{
            setViewController(for: onboardingContainerViewController)
        }
    }
}

extension AppDelegate : OnboardingContainerViewControllerDelegate {
    func didCompleteOnBoarding() {
        LocalState.hasOnboarded = true
        setViewController(for: mainViewController)
    }
}

extension AppDelegate {
    func setViewController(for vc:UIViewController){
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        UIView.transition(with: window!, duration: 0.4 , options: .transitionCrossDissolve ,  animations: nil)
    }
}

extension AppDelegate {
   @objc func didLogout() {
       print("log out from App delegate")
        setViewController(for: loginViewController)
    }
}

