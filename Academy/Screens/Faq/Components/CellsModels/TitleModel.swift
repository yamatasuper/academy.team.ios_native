//
//  TitleModel.swift
//  Academy
//
//  Created by Sergey Dimitriev on 16.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class TitleModel: CellModel {
    let reuseIdentifier = "TitleCell"
    var codeType: TitleCellTypeText
    
    init(codeType: TitleCellTypeText) {
        self.codeType = codeType
    }
}

enum TitleCellTypeText {
    case faq
    case about
    case myCourses
    case personalInfo
    case formQuestion
}

extension TitleCellTypeText {
    var text: String {
        switch self {
            case .faq:
                return "FAQ: все, что нужно знать\nо наших курсах"
            case .about:
                return "О нас"
            case .myCourses:
                return "Мои курсы"
            case .personalInfo:
                return "Мои данные"
            case .formQuestion:
                return "Задайте свой вопрос"
            
        default:
            return ""
        }
    }
}
