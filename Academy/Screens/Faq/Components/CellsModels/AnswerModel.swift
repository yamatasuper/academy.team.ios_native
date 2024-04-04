//
//  AnswerModel.swift
//  Academy
//
//  Created by Sergey Dimitriev on 21.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class AnswerModel: CellModel {
    let reuseIdentifier = "AnswerCell"
    var textHeader: String
    
    init(textHeader: String) {
        self.textHeader = textHeader
    }
}
