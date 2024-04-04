//
//  SubmitModel.swift
//  Academy
//
//  Created by Sergey Dimitriev on 15.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class SubmitModel: CellModel {
    let reuseIdentifier = "SubmitCell"
    var codeType: SubmitCellTypeText
    
    init(codeType: SubmitCellTypeText) {
        self.codeType = codeType
    }
}

enum SubmitCellTypeText {
    case registration
    case auth
}

extension SubmitCellTypeText {
    var text: String {
        switch self {
            case .registration:
                return "Зарегистрироваться"
            case .auth:
                return "Войти"
        default:
            return ""
        }
    }
}
