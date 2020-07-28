//
//  Coordinator.swift
//  CoordinatorPattern
//
//  Created by Medyannik Dmitri on 28.07.2020.
//  Copyright © 2020 Medyannik Dmitri. All rights reserved.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
