//
//  FormQuestionModel.swift
//  Academy
//
//  Created by Sergey Dimitriev on 24.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class FormQuestionModel: CellModel {
    let reuseIdentifier = "FormQuestionCell"
    var textHeader: String
    var id: Int
    
    init(textHeader: String, id: Int) {
        self.textHeader = textHeader
        self.id = id
    }
}
