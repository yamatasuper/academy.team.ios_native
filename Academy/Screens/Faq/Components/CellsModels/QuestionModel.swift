//
//  QuestionModel.swift
//  Academy
//
//  Created by Sergey Dimitriev on 20.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class QuestionModel: CellModel {
    let reuseIdentifier = "QuestionCell"
    var textHeader: String
    var id: Int
    var codeType: QuestionCellTypeText
    
    init(textHeader: String, id: Int, codeType: QuestionCellTypeText) {
        self.textHeader = textHeader
        self.id = id
        self.codeType = codeType
    }
}

enum QuestionCellTypeText {
    case plus
    case minus
    case question
}

extension QuestionCellTypeText {
    var text: String {
        switch self {
            case .plus:
                return "+"
            case .minus:
                return "-"
            case .question:
                return "?"
        default:
            return ""
        }
    }
}
