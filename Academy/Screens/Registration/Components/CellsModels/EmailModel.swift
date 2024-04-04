//
//  EmailModel.swift
//  Academy
//
//  Created by Sergey Dimitriev on 15.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class EmailModel: CellModel {
    let reuseIdentifier = "EmailCell"
    var emailFieldText = ""
    
    init(emailFieldText: String) {
        self.emailFieldText = emailFieldText
    }
}
