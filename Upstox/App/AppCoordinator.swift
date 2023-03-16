//
//  AppCoordinator.swift
//  Upstox
//
//  Created by Sachin Sabat on 23/02/23.
//

import UIKit

final class AppCoordinator: Coordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    //Initialisation of the ui to draw and launch
    func start() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        let startCoordinator = StartCoordinator(navigationController: navigationController)
        coordinate(to: startCoordinator)
    }
}
