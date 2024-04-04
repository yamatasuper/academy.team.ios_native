//
//  MenuLinkModel.swift
//  Academy
//
//  Created by Sergey Dimitriev on 11.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class MenuLinkModel: CellModel {
    let reuseIdentifier = "MenuLinkCell"
    var tag: Int = 0
    var codeType: MenuLinkCellTypeText
    //var style: MenuLinkCellTypeStyle
    
    
    init(codeType: MenuLinkCellTypeText, tag: Int) {//, style: MenuLinkCellTypeStyle
        self.codeType = codeType
        self.tag = tag
        //self.style = style
    }
}

enum MenuLinkCellTypeText {
    case calendary
    case update
    case settings
    case logout
}

extension MenuLinkCellTypeText {
    var text: String {
        switch self {
            case .calendary:
            return "Календарь"
            
            case .update:
            return "Изменить данные"
            
            case .settings:
            return "Настройки"
            
            case .logout:
            return "Выйти"
            
        default:
            return ""
        }
    }
}
