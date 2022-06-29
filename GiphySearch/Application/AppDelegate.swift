//
//  AppDelegate.swift
//  GiphySearch
//
//  Created by Collie on 2022/06/29.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        guard let rootViewController = UIStoryboard(name: "Search", bundle: nil).instantiateInitialViewController() else {
            fatalError("Search.storyboard instantiateInitialViewController is nil")
        }
        
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        
        return true
    }
}

