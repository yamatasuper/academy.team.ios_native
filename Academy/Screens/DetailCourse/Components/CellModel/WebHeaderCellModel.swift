//
//  WebHeaderCellModel.swift
//  Academy
//
//  Created by MovchanArtemiy on 10.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class WebHeaderCellModel: CellModel {
    
    let reuseIdentifier = "webHeaderCell"
    var textHeader: String
    var id: Int
    var codeType: WebHeaderCellTypeText
    
    init(textHeader: String, id: Int, codeType: WebHeaderCellTypeText) {
        //self.reuseIdentifier = reuseIdentifier
        self.textHeader = textHeader
        self.id = id
        self.codeType = codeType
    }
}

enum WebHeaderCellTypeText {
    case arrowUp
    case arrowDown

}

extension WebHeaderCellTypeText {
    var text: String {
        switch self {
            case .arrowUp:
                return "+"
            case .arrowDown:
                return "-"
        default:
            return ""
        }
    }
}
