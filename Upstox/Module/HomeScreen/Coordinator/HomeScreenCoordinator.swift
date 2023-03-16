//
//  HomeScreenCoordinator.swift
//  Upstox
//
//  Created by Sachin Sabat on 23/02/23.
//

import UIKit

// Defining class to push viewcontroller and it's all the push & pop actions from this viewcontroller
// to the target viewcontroller & vice-versa
final class StartCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let startViewController = ViewController()
        navigationController.pushViewController(startViewController, animated: true)
    }
}
