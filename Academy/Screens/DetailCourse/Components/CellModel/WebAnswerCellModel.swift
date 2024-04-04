//
//  WebAnswerModel.swift
//  Academy
//
//  Created by MovchanArtemiy on 10.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class WebAnswerCellModel: CellModel {
    let reuseIdentifier = "webAnswerCell"
    var textHeader: String
    
    init(textHeader: String) {
        self.textHeader = textHeader
    }
}
