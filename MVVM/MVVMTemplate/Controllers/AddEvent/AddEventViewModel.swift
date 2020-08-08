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
    
    private var nameCellViewModel: TitleSubtitleCellViewModel?
    private var dateCellViewModel: TitleSubtitleCellViewModel?
    private var backgroundImageCellViewModel: TitleSubtitleCellViewModel?
    private var cellBuilder: EventsCellBuilder
    
    init(cellBuilder: EventsCellBuilder) {
        self.cellBuilder = cellBuilder
    }
    
    func viewDidLoad() {
        setupCells()
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
    
    func didSelectRow(at indexPath: IndexPath) {
        switch cells[indexPath.row] {
        case .titleSubtitle(let titleSubtitleCellViewModel):
            guard titleSubtitleCellViewModel.type == .image else { return }
            coordinator?.showImagePicker { image in
                titleSubtitleCellViewModel.update(image)
            }
        }
    }
    
}

private extension AddEventViewModel {
    private func setupCells() {
        nameCellViewModel = 
        dateCellViewModel = 
        backgroundImageCellViewModel = 
        
        [nameCellViewModel, dateCellViewModel, backgroundImageCellViewModel].forEach {
            guard let cell = $0 else { return }
            self.cells.append(.titleSubtitle(cell))
        }
    }
}
