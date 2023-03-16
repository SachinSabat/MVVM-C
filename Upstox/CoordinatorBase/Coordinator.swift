//
//  Coordinator.swift
//  Upstox
//
//  Created by Sachin Sabat on 23/02/23.
//

import UIKit
// We will be using this throughout the navigation stack journey
protocol Coordinator {
    func start()
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
