//
//  AppDelegate.swift
//  Spaound
//
//  Created by Saber on 07/03/2021.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        if(UserDefaults.standard.bool(forKey: "notFirstInApp") == false){
            UserDefaults.standard.set(true, forKey: "notFirstInApp")
            pushVC(with: "Home")
            
        }else{
            pushVC(with: "Onboard")
        }
        return true
    }
    
    func pushVC(with idenifier: String){
        UserDefaults.standard.set(true, forKey: "notFirstInApp")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: idenifier)
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
    }
    
    
}

