//
//  TitleLeftLeftCell.swift
//  Academy
//
//  Created by Sergey Dimitriev on 05.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class TitleLeftModel: CellModel {
    let reuseIdentifier = "TitleLeftCell"
    var codeType: TitleLeftCellTypeText
    
    init(codeType: TitleLeftCellTypeText) {
        self.codeType = codeType
    }
}

enum TitleLeftCellTypeText {
    case faq
    case about
    case myCourses
    case personalInfo
    case forMap
}

extension TitleLeftCellTypeText {
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
            case .forMap:
                return "Как нас найти"
            
        default:
            return ""
        }
    }
}
