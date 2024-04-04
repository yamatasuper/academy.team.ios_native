//
//  MailCellModel.swift
//  Academy
//
//  Created by MovchanArtemiy on 03.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class MailCellModel: CellModel {
    var reuseIdentifier = "mailCell"
    var emailFieldText = ""
    
    
    init(reuseIdentifier: String) {
        self.reuseIdentifier = reuseIdentifier
    }
}
