//
//  AppDelegate.swift
//  Upstox
//
//  Created by Sachin Sabat on 23/02/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var coordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        applyNavigationTheme()
        if let window = window {
            coordinator = AppCoordinator(window: window)
            coordinator?.start()
        }
        return true
    }
    
    private func applyNavigationTheme() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        navigationBarAppearance.backgroundColor = UIColor.systemPurple
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }

}

