//
//  EventsCellBuilder.swift
//  MVVMTemplate
//
//  Created by Medyannik Dima on 07.08.2020.
//  Copyright © 2020 Medyannik Dmitri. All rights reserved.
//

import Foundation
 
struct EventsCellBuilder {
    func TitleSubtitleCellViewModel(_ cell: TitleSubtitleCellViewModel.CellType, onCellUpdate: @escaping() -> Void) -> TitleSubtitleCellViewModel {
        switch cell {
        case .text: return TitleSubtitleCellViewModel(title: "Name", subtitle: "", placeholder: "Add a name", type: .text, onCellUpdate: onCellUpdate)
        case .date: return TitleSubtitleCellViewModel(title: "Date", subtitle: "", placeholder: "Select a date", type: .date, onCellUpdate: onCellUpdate)
        case .image: return TitleSubtitleCellViewModel(title: "Image", subtitle: "", placeholder: "", type: .image, onCellUpdate: onCellUpdate)
        }
    }
}
