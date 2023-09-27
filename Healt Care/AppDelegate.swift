//
//  AppDelegate.swift
//  Healt Care
//
//  Created by Gilang Ramdhani Putra on 24/09/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = nil

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//        
//        NotificationCenter.default.addObserver(self, selector: #selector(self.unauthorized(_:)), name: Notification.Name("unAuthorize"), object: nil)
//        
        return true
    }
    

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    @objc func unauthorized(_ sender: Notification) {
        
        if let nc = window?.rootViewController as? UINavigationController,
           nc.viewControllers.first is HomeViewController {
        }
        else {
        }
    }


}

//extension AppDelegate {
//    func setRootViewController(_ viewController: UIViewController) {
//        
//        UIView.transition(with: window!, duration: 0.25, options: [.transitionCrossDissolve, .allowAnimatedContent], animations: { () -> Void in
//            
//            let oldState = UIView.areAnimationsEnabled
//            
//            UIView.setAnimationsEnabled(false)
//            self.window?.rootViewController = viewController
//            UIView.setAnimationsEnabled(oldState)
//            
//        }, completion: nil)
//    }
//    
//    func navigateToHomePage() {
//        let storyboard = UIStoryboard(name: "Home", bundle: nil)
//        let initialViewController = storyboard.instantiateViewController(withIdentifier: "home")
//        setRootViewController(initialViewController)
//    }
//    
//    func navigateToLoginPage() {
//        let storyboard = UIStoryboard(name: "Login", bundle: nil)
//        let initialViewController = storyboard.instantiateViewController(withIdentifier: "login")
//        setRootViewController(initialViewController)
//    }
//}
