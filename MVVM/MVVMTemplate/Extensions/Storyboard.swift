//
//  Storyboard.swift
//  MVVMTemplate
//
//  Created by Medyannik Dima on 29.07.2020.
//  Copyright © 2020 Medyannik Dmitri. All rights reserved.
//

import UIKit

protocol Storyboard {
    static func instantiate() -> Self
}

extension Storyboard where Self: UIViewController {
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let id = String.init(describing: self)
        let viewController = storyboard.instantiateViewController(identifier: id) as! Self
        return viewController
    }
}
