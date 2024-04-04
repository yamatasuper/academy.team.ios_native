//
//  SkipModel.swift
//  Academy
//
//  Created by Sergey Dimitriev on 15.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class SkipModel: CellModel {
    let reuseIdentifier = "SkipCell"
    var codeType: SkipCellTypeText
    
    init(codeType: SkipCellTypeText) {
        self.codeType = codeType
    }
}

enum SkipCellTypeText {
    case skip
    case reset
}

extension SkipCellTypeText {
    var text: String {
        switch self {
            case .skip:
                return "Пропустить"
            case .reset:
                return "Забыли пароль?"
        default:
            return ""
        }
    }
}

