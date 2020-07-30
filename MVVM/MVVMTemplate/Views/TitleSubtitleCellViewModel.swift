//
//  TitleSubtitleCellViewModel.swift
//  MVVMTemplate
//
//  Created by Medyannik Dmitri on 29.07.2020.
//  Copyright © 2020 Medyannik Dmitri. All rights reserved.
//

import Foundation

final class TitleSubtitleCellViewModel {
    let title: String
    private(set) var subtitle: String
    let placeholder: String
    
    init(title: String, subtitle: String, placeholder: String) {
        self.title = title
        self.subtitle = subtitle
        self.placeholder = placeholder
    }
}
