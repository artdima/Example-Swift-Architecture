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
    }
    
    var onUpdate: () -> Void = {}
    
    var coordinator: AddEventCoordinator?
    let title = "Add"
    private(set) var cells: [AddEventViewModel.Cell] = []
    
    func viewDidLoad() {
        self.cells.append(.titleSubtitle(TitleSubtitleCellViewModel(title: "Name", subtitle: "", placeholder: "Add a name", type: .text, onCellUpdate: {})))
        self.cells.append(.titleSubtitle(TitleSubtitleCellViewModel(title: "Date", subtitle: "", placeholder: "Select a date", type: .date, onCellUpdate: { [weak self] in self?.onUpdate() })))
        self.cells.append(.titleSubtitle(TitleSubtitleCellViewModel(title: "Image", subtitle: "", placeholder: "", type: .image, onCellUpdate: { [weak self] in self?.onUpdate() })))
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
    
    func tappedDone() {
        print("Tapped done")
    }
    
    func updateCell(for indexPath: IndexPath, subtitle: String) {
        switch cells[indexPath.row] {
        case .titleSubtitle(let titleSubtitleViewModel):
            titleSubtitleViewModel.update(subtitle)
        }
    }
    
}
