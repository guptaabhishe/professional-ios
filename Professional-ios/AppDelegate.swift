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
    let dummyController = DummyViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        //window?.rootViewController = loginViewController
        window?.rootViewController = AccountSummaryViewController()

        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        dummyController.delegate = self
       // onboardingContainerViewControll
        //window?.rootViewController = onboardingContainerViewController
        
        return true
    }
}

extension AppDelegate:LoginViewControllerDelegate {
    func didLogin() {
        if LocalState.hasOnboarded {
            setViewController(for: dummyController)
        }else{
            setViewController(for: onboardingContainerViewController)
        }
    }
}

extension AppDelegate : OnboardingContainerViewControllerDelegate {
    func didCompleteOnBoarding() {
        LocalState.hasOnboarded = true
        setViewController(for: dummyController)
    }
}

extension AppDelegate {
    func setViewController(for vc:UIViewController){
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        UIView.transition(with: window!, duration: 0.4 , options: .transitionCrossDissolve ,  animations: nil)
    }
}

extension AppDelegate : LogoutDelegate{
    func didLogout() {
        setViewController(for: loginViewController)
    }
}
