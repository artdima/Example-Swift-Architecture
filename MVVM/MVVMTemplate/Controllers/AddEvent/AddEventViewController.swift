//
//  AddEventViewController.swift
//  MVVMTemplate
//
//  Created by Medyannik Dima on 29.07.2020.
//  Copyright © 2020 Medyannik Dmitri. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController, Storyboard {

    var viewModel: AddEventViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }
}
