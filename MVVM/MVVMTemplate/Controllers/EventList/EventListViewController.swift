//
//  EventListViewController.swift
//  MVVMTemplate
//
//  Created by Medyannik Dmitri on 27.07.2020.
//  Copyright © 2020 Medyannik Dmitri. All rights reserved.
//

import UIKit

class EventListViewController: UIViewController, Storyboard {
    
    var viewModel: EventListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        let plusImage = UIImage(systemName: "plus.circle.fill")
        let barButtomItem = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(tabPlusBarBattom))
        barButtomItem.tintColor = .primacy
        navigationItem.rightBarButtonItem = barButtomItem
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    @objc private func tabPlusBarBattom() {
        
        viewModel.tappedAddEvent()
    }
}
