//
//  ViewController.swift
//  CoordinatorPattern
//
//  Created by Medyannik Dmitri on 28.07.2020.
//  Copyright © 2020 Medyannik Dmitri. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboard {
    
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buyTapped(_ sender: Any) {
        coordinator?.buy()
    }
    
    @IBAction func createAccauntTapped(_ sender: Any) {
        coordinator?.createAccount()
    }
}

