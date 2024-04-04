//
//  RegistrationCellModel.swift
//  Academy
//
//  Created by MovchanArtemiy on 05.02.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation

class RegistrationCellModel: CellModel {
    var reuseIdentifier = "registrationCell"
    var registration: Bool
    
    
    init(reuseIdentifier: String, registration: Bool) {
        self.reuseIdentifier = reuseIdentifier
        self.registration = registration
    }
}
