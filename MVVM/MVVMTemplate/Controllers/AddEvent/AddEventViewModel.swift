//
//  AddEventViewModel.swift
//  MVVMTemplate
//
//  Created by Medyannik Dima on 29.07.2020.
//  Copyright © 2020 Medyannik Dmitri. All rights reserved.
//

import UIKit

final class AddEventViewModel {
    
    enum Cell {
        case titleSubtitle(TitleSubtitleCellViewModel)
        case titleImage
    }
    
    var onUpdate: () -> Void = {}
    
    var coordinator: AddEventCoordinator?
    let title = "Add"
    private(set) var cells: [AddEventViewModel.Cell] = []
    
    func viewDidLoad() {
        self.cells.append(.titleSubtitle(TitleSubtitleCellViewModel(title: "Name", subtitle: "", placeholder: "Add here..")))
        self.cells.append(.titleSubtitle(TitleSubtitleCellViewModel(title: "Name", subtitle: "", placeholder: "Add here..")))
        onUpdate()
    }
    
    func viewDidDisappear() {
        coordinator?.didFinishAddEvent()
    }
    
    func numberOfRows() -> Int {
        return cells.count
    }
    
    func cell(for indecPath: IndexPath) -> Cell {
        return cells[indecPath.row]
    }
    
}
