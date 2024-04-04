//
//  SignUpCellModel.swift
//  Academy
//
//  Created by MovchanArtemiy on 28.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class SignUpCellModel: CellModel {
    var reuseIdentifier = "signUpCell"
    var headName: String
    var position: String
    
    
    init(reuseIdentifier: String, headName: String, position: String) {
        self.reuseIdentifier = reuseIdentifier
        self.headName = headName
        self.position = position
    }
}
