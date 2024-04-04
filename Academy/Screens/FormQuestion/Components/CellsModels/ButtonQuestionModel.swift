//
//  ButtonQuestionModel.swift
//  Academy
//
//  Created by Sergey Dimitriev on 06.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class ButtonQuestionModel: CellModel {
    let reuseIdentifier = "ButtonQuestionCell"
    var codeType: ButtonQuestionCellTypeText
    
    init(codeType: ButtonQuestionCellTypeText) {
        self.codeType = codeType
    }
}

enum ButtonQuestionCellTypeText {
    case send
}

extension ButtonQuestionCellTypeText {
    var text: String {
        switch self {
            case .send:
                return "Отправить заявку"
        default:
            return ""
        }
    }
}

