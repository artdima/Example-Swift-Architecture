//
//  MainCoordinator.swift
//  CoordinatorPattern
//
//  Created by Medyannik Dmitri on 28.07.2020.
//  Copyright © 2020 Medyannik Dmitri. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = ViewController.instantiate()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func buy(){
        let buyViewController = BuyViewController.instantiate()
        buyViewController.coordinator = self
        navigationController.pushViewController(buyViewController, animated: true)
    }
    
    func createAccount(){
        let createAccountViewController = CreateAccountViewController.instantiate()
        createAccountViewController.coordinator = self
        navigationController.pushViewController(createAccountViewController, animated: true)
    }
}
