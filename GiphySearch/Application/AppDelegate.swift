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
        
        // Todo: Seach 초기화면 생성 시 변경 필요
        let viewController = ViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        return true
    }
}

