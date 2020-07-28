//
//  AppCoordinator.swift
//  MVVMTemplate
//
//  Created by Medyannik Dmitri on 27.07.2020.
//  Copyright © 2020 Medyannik Dmitri. All rights reserved.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get }
    func start()
}

final class AppCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        let eventListCoordinator = EventListCoordinator(navigationController: navigationController)
        self.childCoordinators.append(eventListCoordinator)
        eventListCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    

}
